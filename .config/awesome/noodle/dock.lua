-- TODO: The functions that create and update the buttons should be decoupled
-- from the dock logic. This will make it easy to create new dock themes.
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")
local apps = require("apps")
local cairo = require("lgi").cairo
local icons = require("icons")
local class_icons = icons.text.by_class

local item_font = "icomoon 15"
local item_bg = "#434c5e"
local item_size = dpi(50)
local item_shape = helpers.squircle(1.7, 0)
local item_margin = dpi(8) -- For spacing between items
local indicator_spacing = dpi(8)
local indicator_height = dpi(7)

local function draw_indicator_shape_unfocused(cr)
    cr:arc(item_size / 2, indicator_height, indicator_height, 0, 2 * math.pi)
    cr:close_path()
    cr:fill()
end

local dock_class_count = {}

local dock_items = {}

local dock_recently_focused = {}

dock_pinned_apps = {
    { class = "firefox", launcher = apps.browser },
}

local dock_pinned_classes = {}
local dock_pinned_launchers = {}
for _,v in ipairs(dock_pinned_apps) do
    table.insert(dock_pinned_classes, v.class)
    dock_pinned_launchers[v.class] = v.launcher
end

local function class_window_exists(class)
    return dock_class_count[class] and dock_class_count[class] > 0
end

local function class_window_focused(class)
    return client.focus and client.focus.class == class
end

local function cycle_by_class(class, forward)
    local clients = helpers.find_clients({ class = class })
    local num_clients = #clients
    if num_clients == 0 then
        -- Nothing to do
        return
    elseif num_clients == 1 then
        clients[1]:jump_to()
    else
        clients[forward and 2 or num_clients]:jump_to()
    end
end

local function find_relevant_client(class)
    if dock_class_count[class] == 1 then
        return helpers.find_clients({ class = class }, true)
    end

    local urgent_client = helpers.find_clients({ class = class, urgent = true }, true)
    if urgent_client then
        return urgent_client
    end

    if dock_recently_focused[class] and dock_recently_focused[class].valid then
        return dock_recently_focused[class]
    end

    return helpers.find_clients({ class = class }, true)
end

local function generate_dock_icon(c, bg, fg, symbol)
    local icon = wibox.widget({
        {
            -- font = item_font,
            -- markup = helpers.colorize_text(symbol, fg),
            image = symbol,
            -- align = "center",
            -- valign = "center",
            widget = wibox.widget.imagebox()
        },
        shape = item_shape,
        forced_height = item_size,
        forced_width = item_size,
        bg = bg,
        widget = wibox.container.background
    })

    local indicator_focused = cairo.ImageSurface.create(cairo.Format.ARGB32, item_size, indicator_height)
    local indicator_unfocused = cairo.ImageSurface.create(cairo.Format.ARGB32, item_size, indicator_height)

    local cr
    cr = cairo.Context(indicator_unfocused)
    cr:set_source(gears.color(fg))
    draw_indicator_shape_unfocused(cr)

    local is_focused = client.focus and (client.focus.class == c.class) and true or false

    -- Put everything together
    local w = wibox.widget({
        {
            icon,
            {
                {
                    {
                        id = "indicator_unfocused",
                        bgimage = indicator_unfocused,
                        visible = (dock_class_count[c.class] > 0) and not is_focused,
                        widget = wibox.container.background
                    },
                    {
                        id = "indicator_focused",
                        bg = fg,
                        shape = helpers.prrect(dpi(60), true, true, false, false),
                        visible = is_focused,
                        widget = wibox.container.background
                    },
                    forced_height = indicator_height,
                    forced_width = item_size - item_margin * 2,
                    id = "indicator",
                    layout = wibox.layout.stack
                },
                {
                    forced_height = indicator_height,
                    widget = wibox.container.background
                },
                layout = wibox.layout.stack
            },
            spacing = indicator_spacing,
            layout = wibox.layout.fixed.vertical
        },
        left = item_margin,
        right = item_margin,
        widget = wibox.container.margin
    })

    local class = c.class

    w:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            if dock_pinned_launchers[class] and not class_window_exists(class) then
                dock_pinned_launchers[class]()
            else
                if class_window_focused(class) then
                    client.focus.minimized = true
                else
                    find_relevant_client(class):jump_to()
                end
            end
        end),

        awful.button({ superkey }, 1, function ()
            local found = find_relevant_client(class)
            if found then
                found:move_to_tag(mouse.screen.selected_tag)
                found.minimized = false
                found:activate()
            end
        end),

        awful.button({ }, 4, function ()
            cycle_by_class(class, false)
        end),
        awful.button({ }, 5, function ()
            cycle_by_class(class, true)
        end)
    ))

    helpers.add_hover_cursor(w, "hand1")

    return w
end

local dock = wibox.widget({
    layout = wibox.layout.fixed.horizontal
})

-- -- Initialize dock with pinned clients
-- for i = 1, #dock_pinned_classes do
--     local class = dock_pinned_classes[i]
--     local i = class_icons[class] or class_icons['_']
--     dock_class_count[class] = dock_class_count[class] and (dock_class_count[class] + 1) or 0
--     dock_items[class] = generate_dock_icon({ class = class }, i.symbol)
--     dock:add(dock_items[class])
-- end

local add_client
local remove_client
add_client = function(c)
    if not c.class then return end

    dock_class_count[c.class] = (dock_class_count[c.class] or 0) + 1

    if dock_class_count[c.class] == 1 then
        local i = class_icons[c.class] or class_icons['_']
        if dock_pinned_launchers[c.class] then
            local item = dock_items[c.class]
            if not item then
                return
            end
            item:get_children_by_id("indicator")[1].visible = true

            item:get_children_by_id("indicator_unfocused")[1].visible = true
        else
            dock_items[c.class] = generate_dock_icon(c, item_bg,i.color, "telegram")
            dock:add(dock_items[c.class])
        end
    end

    local old_class = c.class
    local handle_class_change
    handle_class_change = function(c)
        c:disconnect_signal("property::class", handle_class_change)
        remove_client({ class = old_class })
        add_client(c)
    end
    c:connect_signal("property::class", handle_class_change)
end

remove_client = function(c)
    if not c.class then return end

    dock_class_count[c.class] = dock_class_count[c.class] - 1

    if dock_class_count[c.class] == 0 then
        if dock_pinned_launchers[c.class] then
            local item = dock_items[c.class]
            if not item then
                return
            end
            local indicator = item:get_children_by_id("indicator")[1]
            indicator.visible = false
        else
            dock:remove_widgets(dock_items[c.class])
            dock_items[c.class] = nil
        end
    end
end

local function update_focus(c)
    if not c.class then return end

    local item = dock_items[c.class]
    if not item then return end
    local indicator_focused = item:get_children_by_id("indicator_focused")[1]
    local indicator_unfocused = item:get_children_by_id("indicator_unfocused")[1]
    if client.focus and client.focus == c then
        indicator_unfocused.visible = false
        indicator_focused.visible = true
    else
        indicator_unfocused.visible = true
        indicator_focused.visible = false

        dock_recently_focused[c.class] = c
    end
end

client.connect_signal("manage", add_client)
client.connect_signal("unmanage", remove_client)
client.connect_signal("property::hidden", function(c)
    if c.hidden then
        remove_client(c)
    else
        add_client(c)
    end
end)
client.connect_signal("focus", update_focus)
client.connect_signal("unfocus", update_focus)

return dock
