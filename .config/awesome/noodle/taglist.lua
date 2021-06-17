local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")-- For spacing between items

local taglist_buttons = gears.table.join(
                            awful.button({}, 1, function(t) t:view_only() end),
                            awful.button({modkey}, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
                            awful.button({modkey}, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end), awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
                            awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
    end))

local update_taglist = function(item, tag, index)
    if tag.selected then
        item.image = beautiful.taglist_icons_selected[index]
        item.cursor = 'hand1'
    elseif tag.urgent then
        item.image = beautiful.taglist_icons_noempty[index]
    elseif #tag:clients() > 0 then
        item.image = beautiful.taglist_icons_noempty[index]
    else
        item.image = beautiful.taglist_icons_empty[index]
    end
    item:connect_signal('mouse::enter', function()
        if tag.selected then
            item.image = beautiful.taglist_icons_selected[index]
        elseif tag.urgent then
            item.image = beautiful.taglist_icons_noempty[index]
        elseif #tag:clients() > 0 then
            item.image = beautiful.taglist_icons_noempty_hover[index]
        else
            item.image = beautiful.taglist_icons_hover[index]
        end
    end)
    item:connect_signal('mouse::leave', function()
        if tag.selected then
            item.image = beautiful.taglist_icons_selected[index]
        elseif tag.urgent then
            item.image = beautiful.taglist_icons_noempty[index]
        elseif #tag:clients() > 0 then
            item.image = beautiful.taglist_icons_noempty[index]
        else
            item.image = beautiful.taglist_icons_empty[index]
        end
    end)
end

awful.screen.connect_for_each_screen(function(s)
   mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.horizontal,
        widget_template = {
            forced_height = dpi(50),
            forced_width = dpi(50),
            widget = wibox.widget.imagebox,
            -- Add support for hover colors and an index label
            create_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end
        },
        forced_height = dpi(70),
        widget = wibox.container.background,
        bg = beautiful.bg_normal,
        buttons = taglist_buttons
    }
end)
    -- Put everything together
local w = wibox.widget({
    wibox.container.margin(mytaglist, dpi(10), dpi(15), dpi(0), dpi(0)),
    layout = wibox.layout.fixed.horizontal
})
do return w end

local taglist = wibox.widget({
    layout = wibox.layout.fixed.horizontal
})

return taglist
