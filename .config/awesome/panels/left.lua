local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local icons = require("icons")
local keys = require("keys")
local wibox = require("wibox")

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
   s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.horizontal,
        widget_template = {
            widget = wibox.widget.imagebox,
            -- Add support for hover colors and an index label
            create_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end
        },
        buttons = taglist_buttons
    }

    local panel_shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, 12)
   end
   local maximized_panel_shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
   end

    panel = awful.wibar({
        position = "bottom",
        screen = s,
        width = s.geometry.width * 2.7/10,
        height = dpi(50),
        type = "dock",
        ontop = true,
        shape = panel_shape,
        visible = true
    })

    panel:setup{
        expand = "none",
        layout = wibox.layout.align.horizontal,
        nil,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        nil
    }

   -- hide panel when client is fullscreen
   local function change_panel_visibility(client)
      if client.screen == s then
         panel.ontop = not client.fullscreen
      end
  end

     -- connect panel visibility function to relevant signals
   client.connect_signal("property::fullscreen", change_panel_visibility)
   client.connect_signal("focus", change_panel_visibility)

  -- maximize panel if client is maximized
   local function toggle_maximize_left_panel(is_maximized)
      if s == awful.screen.focused() then
         if is_maximized then
            panel.shape = maximized_panel_shape
         else
            panel.shape = panel_shape
         end
      end
   end

   -- maximize if a client is maximized
   client.connect_signal("property::maximized", function(c)
      toggle_maximize_left_panel(c.maximized)
   end)

   client.connect_signal("manage", function(c)
      if awful.tag.getproperty(c.first_tag, "layout") == awful.layout.suit.max then
         toggle_maximize_left_panel(true)
      end
   end)

   -- unmaximize if a client is removed and there are no maximized clients left
   client.connect_signal("unmanage", function(c)
      local t = awful.screen.focused().selected_tag
      -- if client was maximized
      if c.maximized then
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               return
            end
         end
         toggle_maximize_left_panel(false)

      -- if tag was maximized
      elseif awful.tag.getproperty(t, "layout") == awful.layout.suit.max then
         -- check if any clients are open (and therefore maximized)
         for _ in pairs(t:clients()) do
            return
         end
         toggle_maximize_left_panel(false)
      end
   end)

   -- maximize if layout is maximized and a client is in the layout
   tag.connect_signal("property::layout", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_left_panel(true)
            return
         end
         toggle_maximize_left_panel(false)
      else
         toggle_maximize_left_panel(false)
      end
   end)

   -- maximize if a tag is swapped to with a maximized client
   tag.connect_signal("property::selected", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_left_panel(true)
            return
         end
         toggle_maximize_left_panel(false)
      else
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               toggle_maximize_left_panel(true)
               return
            end
         end
         toggle_maximize_left_panel(false)
      end
   end)

end)


