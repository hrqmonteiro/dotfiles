local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local icons = require("icons")

local keys = require("keys")

-- local left_panel = function(s)

local left_panel = {}

left_panel.create = function(s)

local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local update_taglist = function (item, tag, index)
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
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.vertical,
        widget_template = {
            widget = wibox.widget.imagebox,
            -- Add support for hover colors and an index label
            create_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
        },
        buttons = taglist_buttons
    }
end)

    s.mytasklist = awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons  = tasklist_buttons,
    layout   = {
        spacing_widget = {
            {
                forced_width  = 24,
                forced_height = 5,
                thickness     = 1,
                color         = '#777777',
                widget        = wibox.widget.separator
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
        },
        spacing = 1,
        layout  = wibox.layout.fixed.vertical
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
        {
            wibox.widget.base.make_widget(),
            forced_height = 5,
            id            = 'background_role',
            widget        = wibox.container.background,
        },
        {
            awful.widget.clienticon,
            margins = 5,
            widget  = wibox.container.margin
        },
        nil,
        layout = wibox.layout.align.horizontal,
    },
}

s.mylauncher = wibox.widget.imagebox(icons.image.launcher)
s.mylauncher:buttons(gears.table.join(
        -- Left click - Toggle sidebar
        awful.button({ }, 1, function ()
           awful.spawn.with_shell("rofi -show drun")
        end)
    ))
s.mylauncher:connect_signal('mouse::enter', function(self)
    self.image = icons.image.launcher_hover
end)
s.mylauncher:connect_signal('mouse::leave', function(self)
    self.image = icons.image.launcher
end)

s.mysystray = wibox.widget.systray({
  })

s.mysystray:set_horizontal(false)
s.mysystray:set_base_size(24)

   local panel_shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 20)
   end
   local maximized_panel_shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 20)
   end

-- Create the wibox
panel = wibox({
position = "left",
screen = s,
height = s.geometry.height,
width = dpi(52),
type = 'dock',
ontop = true,
visible = true,
shape = panel_shape
})

panel:struts({
  left = dpi(52)
})

-- Add widgets to the wibox
panel:setup {
    expand = "none",
    layout = wibox.layout.align.vertical,
    s.mylauncher,
    {
      layout = wibox.layout.fixed.vertical,
      wibox.layout.margin(s.mytaglist, dpi(2), dpi(4), dpi(4), dpi(4)),
      -- s.mytasklist,
    },
    wibox.layout.margin(s.mysystray, dpi(12), dpi(10), dpi(10), dpi(10)),
}

-- ===================================================================
   -- Functionality
   -- ===================================================================


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

 end

return left_panel
