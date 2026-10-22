-- xdg session types

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
-- -- -- --- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- can disable spash text

splash = true
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- Set programs that you use NOTE: generally no need to do so since fuzzel does that for you.
local terminal = "foot"
local fileManager = "thunar"
local menu = "fuzzel"
local browser = "Zen"
 hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
   hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("waybar -c ~/.config/waybar/config-simple -s ~/.config/waybar/style-simple.css &")
   hl.exec_cmd("~/.config/hypr/wallpaper.sh")
        -- THIS NEEDS EDITING BASED ON YOUR FS

end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

 hl.config({
   ecosystem = {
     enforce_permissions = true,
   },
 })

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
--  hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 3,

        col = {
            active_border   = { colors = {"#A8A8A4", "#FFFFFF"}, angle = 30 },
            inactive_border = "#A9A9A9",
        },
        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
hl.config({ animations = { enabled = true } })

hl.curve("bounce", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.35 } } })
hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.13, 0.99 }, { 0.29, 1.2 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "bounce", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "bounce", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "bounce", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "linear" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "linear" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 4, bezier = "linear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 4, bezier = "linear" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 5, bezier = "linear" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "linear" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 3, bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6, bezier = "bounce", style = "slidevert" })
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "bounce", style = "slide top" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 22, bezier = "linear", style = "loop" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})
hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- hl.config({
  --  misc = {
    --    force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
      --   disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    -- },
-- })


hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, 
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
local mainMod = "SUPER" 
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + f3", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + TAB", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" ~/Pictures/screenshot_$(date +'%s').png]]))
hl.bind("f7", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
   name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
