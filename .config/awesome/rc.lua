local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears = require "gears"
local awful = require "awful"
require "awful.autofocus"
local wibox = require "wibox"

local beautiful = require "beautiful"

local naughty = require "naughty"
naughty.config.defaults["icon_size"] = 100

local lain = require "lain"
local freedesktop = require "freedesktop"

local hotkeys_popup = require("awful.hotkeys_popup").widget
require "awful.hotkeys_popup.keys"
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi = require("beautiful.xresources").apply_dpi

if awesome.startup_errors then
  naughty.notify {
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors,
  }
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    if in_error then
      return
    end
    in_error = true

    naughty.notify {
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err),
    }
    in_error = false
  end)
end

local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

run_once { "unclutter -root" }

local themes = {
  "multicolor", -- 1
  "powerarrow", -- 2
  "powerarrow-blue", -- 3
  "blackburn", -- 4
}

local chosen_theme = themes[3]

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv "HOME", chosen_theme)
beautiful.init(theme_path)

-- modkey or mod4 = super key
local modkey = "Mod4"
local altkey = "Mod1"
local modkey1 = "Control"

local browser1 = "qutebrowser"
local browser2 = "brave"
local filemanager = "vifm"
local terminal = "kitty"

-- awesome variables
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
awful.layout.suit.tile.left.mirror = true
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
}

awful.util.taglist_buttons = my_table.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
  end),
  awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

awful.util.tasklist_buttons = my_table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c.minimized = false
      if not c:isvisible() and c.first_tag then
        c.first_tag:view_only()
      end
      client.focus = c
      c:raise()
    end
  end),
  awful.button({}, 3, function()
    local instance = nil

    return function()
      if instance and instance.wibox.visible then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients { theme = { width = dpi(250) } }
      end
    end
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv "HOME", chosen_theme))

local myawesomemenu = {
  {
    "hotkeys",
    function()
      return false, hotkeys_popup.show_help
    end,
  },
  { "arandr", "arandr" },
}

awful.util.mymainmenu = freedesktop.menu.build {
  before = {
    { "Awesome", myawesomemenu },
    --{ "Atom", "atom" },
    -- other triads can be put here
  },
  after = {
    { "Terminal", terminal },
    {
      "Log out",
      function()
        awesome.quit()
      end,
    },
    { "Sleep", "systemctl suspend" },
    { "Restart", "systemctl reboot" },
    { "Shutdown", "systemctl poweroff" },
    -- other triads can be put here
  },
}

screen.connect_signal("property::geometry", function(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end)

screen.connect_signal("arrange", function(s)
  local only_one = #s.tiled_clients == 1
  for _, c in pairs(s.clients) do
    if only_one and not c.floating or c.maximized then
      c.border_width = 2
    else
      c.border_width = beautiful.border_width
    end
  end
end)

awful.screen.connect_for_each_screen(function(s)
  beautiful.at_screen_connect(s)
  s.systray = wibox.widget.systray()
  s.systray.visible = true
end)

root.buttons(my_table.join(
  awful.button({}, 3, function()
    awful.util.mymainmenu:toggle()
  end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

-- {{{ Key bindings
globalkeys = my_table.join(

  -- {{{ Personal keybindings
  awful.key({ modkey }, "w", function()
    awful.util.spawn(browser2)
  end, {
    description = browser2,
    group = "Applications",
  }),

  awful.key({ altkey }, "t", function()
    awful.util.spawn "obsidian"
  end, {
    description = "Obsidian",
    group = "Applications",
  }),

  awful.key({ modkey }, "d", function()
    awful.util.spawn(string.format("%s -e vifm", terminal))
  end, {
    description = "File browser",
    group = "Applications",
  }),

  -- dmenu
  awful.key({ modkey }, "space", function()
    awful.spawn(
      string.format(
        "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn NotoMonoRegular:bold:pixelsize=14",
        beautiful.bg_normal,
        beautiful.fg_normal,
        beautiful.bg_focus,
        beautiful.fg_focus
      )
    )
  end, {
    description = "show dmenu",
    group = "hotkeys",
  }),

  -- super + ...
  awful.key({ modkey }, "t", function()
    awful.util.spawn(terminal)
  end, {
    description = "terminal",
    group = "super",
  }),
  awful.key({ modkey }, "v", function()
    awful.util.spawn "pavucontrol"
  end, {
    description = "pulseaudio control",
    group = "super",
  }),
  awful.key({ modkey }, "x", function()
    awful.util.spawn "arcolinux-logout"
  end, {
    description = "exit",
    group = "hotkeys",
  }),
  awful.key({ modkey }, "Escape", function()
    awful.util.spawn "xkill"
  end, {
    description = "Kill proces",
    group = "hotkeys",
  }),

  -- screenshots
  awful.key({}, "Print", function()
    awful.util.spawn "scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'"
  end, {
    description = "Scrot",
    group = "screenshots",
  }),
  awful.key({ modkey1 }, "Print", function()
    awful.util.spawn "xfce4-screenshooter"
  end, {
    description = "Xfce screenshot",
    group = "screenshots",
  }),
  awful.key({ modkey1, "Shift" }, "Print", function()
    awful.util.spawn "gnome-screenshot -i"
  end, {
    description = "Gnome screenshot",
    group = "screenshots",
  }),

  -- Personal keybindings}}}

  -- Hotkeys Awesome

  awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

  -- Default client focus
  awful.key({ altkey }, "j", function()
    awful.client.focus.byidx(1)
  end, {
    description = "focus next by index",
    group = "client",
  }),
  awful.key({ altkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, {
    description = "focus previous by index",
    group = "client",
  }),

  -- Layout manipulation
  awful.key({ altkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, {
    description = "swap with next client by index",
    group = "client",
  }),
  awful.key({ altkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, {
    description = "swap with previous client by index",
    group = "client",
  }),
  awful.key({ modkey }, "Tab", function()
    awful.screen.focus_relative(1)
  end, {
    description = "focus the next screen",
    group = "screen",
  }),
  awful.key({ altkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

  -- Dynamic tagging
  awful.key({ modkey, "Shift" }, "n", function()
    lain.util.add_tag()
  end, {
    description = "add new tag",
    group = "tag",
  }),
  awful.key({ modkey, "Control" }, "r", function()
    lain.util.rename_tag()
  end, {
    description = "rename tag",
    group = "tag",
  }),
  awful.key({ modkey, "Shift" }, "Left", function()
    lain.util.move_tag(-1)
  end, {
    description = "move tag to the left",
    group = "tag",
  }),
  awful.key({ modkey, "Shift" }, "Right", function()
    lain.util.move_tag(1)
  end, {
    description = "move tag to the right",
    group = "tag",
  }),
  awful.key({ modkey, "Shift" }, "y", function()
    lain.util.delete_tag()
  end, {
    description = "delete tag",
    group = "tag",
  }),

  -- Standard program
  awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

  awful.key({ altkey, "Shift" }, "l", function()
    awful.tag.incmwfact(0.05)
  end, {
    description = "increase master width factor",
    group = "layout",
  }),
  awful.key({ altkey, "Shift" }, "h", function()
    awful.tag.incmwfact(-0.05)
  end, {
    description = "decrease master width factor",
    group = "layout",
  }),
  awful.key({ modkey, "Shift" }, "h", function()
    awful.tag.incnmaster(1, nil, true)
  end, {
    description = "increase the number of master clients",
    group = "layout",
  }),
  awful.key({ modkey, "Shift" }, "l", function()
    awful.tag.incnmaster(-1, nil, true)
  end, {
    description = "decrease the number of master clients",
    group = "layout",
  }),
  awful.key({ modkey, "Control" }, "h", function()
    awful.tag.incncol(1, nil, true)
  end, {
    description = "increase the number of columns",
    group = "layout",
  }),
  awful.key({ modkey, "Control" }, "l", function()
    awful.tag.incncol(-1, nil, true)
  end, {
    description = "decrease the number of columns",
    group = "layout",
  }),

  awful.key({ modkey, "Control" }, "n", function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      client.focus = c
      c:raise()
    end
  end, {
    description = "restore minimized",
    group = "client",
  }),

  -- Brightness
  awful.key({}, "XF86MonBrightnessUp", function()
    os.execute "xbacklight -inc 10"
  end, {
    description = "+10%",
    group = "hotkeys",
  }),
  awful.key({}, "XF86MonBrightnessDown", function()
    os.execute "xbacklight -dec 10"
  end, {
    description = "-10%",
    group = "hotkeys",
  }),

  -- ALSA volume control
  --awful.key({ modkey1 }, "Up",
  awful.key({}, "XF86AudioRaiseVolume", function()
    os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
    beautiful.volume.update()
  end),
  --awful.key({ modkey1 }, "Down",
  awful.key({}, "XF86AudioLowerVolume", function()
    os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
    beautiful.volume.update()
  end),
  awful.key({}, "XF86AudioMute", function()
    os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
    beautiful.volume.update()
  end),
  awful.key({ modkey1, "Shift" }, "m", function()
    os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
    beautiful.volume.update()
  end),
  awful.key({ modkey1, "Shift" }, "0", function()
    os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
    beautiful.volume.update()
  end),

  --Media keys supported by mpd.
  awful.key({}, "XF86AudioPlay", function()
    awful.util.spawn "mpc toggle"
  end),
  awful.key({}, "XF86AudioNext", function()
    awful.util.spawn "mpc next"
  end),
  awful.key({}, "XF86AudioPrev", function()
    awful.util.spawn "mpc prev"
  end),
  awful.key({}, "XF86AudioStop", function()
    awful.util.spawn "mpc stop"
  end),

  awful.key({ altkey }, "x", function()
    awful.prompt.run {
      prompt = "Run Lua code: ",
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. "/history_eval",
    }
  end, {
    description = "lua execute prompt",
    group = "awesome",
  })
  --]]
)

clientkeys = my_table.join(
  awful.key({ altkey, "Shift" }, "m", lain.util.magnify_client, { description = "magnify client", group = "client" }),
  awful.key({ modkey }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, {
    description = "toggle fullscreen",
    group = "client",
  }),
  awful.key({ modkey }, "c", function(c)
    c:kill()
  end, { description = "close", group = "hotkeys" }),
  awful.key(
    { modkey, "Shift" },
    "space",
    awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }
  ),
  awful.key({ altkey, "Shift" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, {
    description = "move to master",
    group = "client",
  }),
  awful.key({ modkey }, "o", function(c)
    c:move_to_screen()
  end, {
    description = "move to screen",
    group = "client",
  }),
  --awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
  --{description = "toggle keep on top", group = "client"}),
  awful.key({ modkey }, "n", function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, {
    description = "minimize",
    group = "client",
  }),
  awful.key({ modkey }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, {
    description = "maximize",
    group = "client",
  })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = { description = "view tag #", group = "tag" }
    descr_toggle = { description = "toggle tag #", group = "tag" }
    descr_move = { description = "move focused client to tag #", group = "tag" }
    descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
  end
  globalkeys = my_table.join(
    globalkeys,
    -- View tag only.
    awful.key({ altkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, descr_view),
    -- Toggle tag display.
    awful.key({ altkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, descr_toggle),
    -- Move client to tag.
    awful.key({ altkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
          tag:view_only()
        end
      end
    end, descr_move),
    -- Toggle tag on focused client.
    awful.key({ altkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, descr_toggle_focus)
  )
end

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      size_hints_honor = false,
    },
  },

  -- Titlebars
  { rule_any = { type = { "dialog", "normal" } }, properties = { titlebars_enabled = false } },

  { rule = { class = "Xfce4-settings-manager" }, properties = { floating = false } },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
      },
      class = {
        "Arandr",
        "Arcolinux-welcome-app.py",
        "Blueberry",
        "Galculator",
        "Gnome-font-viewer",
        "Gpick",
        "Imagewriter",
        "Font-manager",
        "Kruler",
        "MessageWin", -- kalarm.
        "arcolinux-logout",
        "Peek",
        "Skype",
        "System-config-printer.py",
        "Sxiv",
        "Unetbootin.elf",
        "Wpa_gui",
        "pinentry",
        "veromix",
        "xtightvncviewer",
        "Xfce4-terminal",
      },

      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
        "Preferences",
        "setup",
      },
    },
    properties = { floating = true },
  },

  -- Floating clients but centered in screen
  {
    rule_any = {
      class = {
        "Polkit-gnome-authentication-agent-1",
        "Arcolinux-calamares-tool.py",
      },
    },
    properties = { floating = true },
    callback = function(c)
      awful.placement.centered(c, nil)
    end,
  },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- Custom
  if beautiful.titlebar_fun then
    beautiful.titlebar_fun(c)
    return
  end

  -- Default
  -- buttons for the titlebar
  local buttons = my_table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c, { size = dpi(21) }):setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        align = "center",
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal,
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal(),
    },
    layout = wibox.layout.align.horizontal,
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

-- }}}

-- Autostart applications
awful.spawn.with_shell "~/.config/awesome/autostart.sh"
awful.spawn.with_shell "picom -b --config  $HOME/.config/awesome/picom.conf"
