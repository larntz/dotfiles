local wezterm = require 'wezterm';

wezterm.on("format-window-title", function(tab, tabs, panes, config)
  local zoomed = ""
  if tab.active_pane.is_zoomed then
    zoomed = "[Z] "
  end

  local index = ""
  if #tabs > 1 then
    index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title
end)

return {
    automatically_reload_config = true,
    window_background_opacity = 0.8,
    hide_tab_bar_if_only_one_tab = true,
    font_size = 11.5,
    color_scheme = "Gruvbox Dark",
    warn_about_missing_glyphs = false,
    freetype_load_target = "Light",
    font = wezterm.font_with_fallback({
      "JetBrainsMono Nerd Font",
      "Fira Code",
    }),

    colors = {
        tab_bar = {
            background = "#000000",
            active_tab = {
                bg_color = "Black",
                fg_color = "#ebdbb2",
                intensity = "Half",
                underline = "None",
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = "#141918",
                fg_color = "#808080",
            },
            inactive_tab_hover = {
                bg_color = "#141918",
                fg_color = "Green",
                italic = true,
            },
        },
    },

    --key mapping
    use_dead_keys=false,
    --leader = { key="a", mods="CTRL"},
    keys = {
	--{ key = "\"", mods="LEADER",     action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
	--{ key = "%",  mods="LEADER",     action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
	--{ key = "z",  mods="LEADER",     action="TogglePaneZoomState" },
	--{ key = "H",  mods="LEADER",     action=wezterm.action{AdjustPaneSize={"Left", 5}}},
	--{ key = "J",  mods="LEADER",     action=wezterm.action{AdjustPaneSize={"Down", 5}}},
	--{ key = "K",  mods="LEADER",     action=wezterm.action{AdjustPaneSize={"Up", 5}}},
	--{ key = "L",  mods="LEADER",     action=wezterm.action{AdjustPaneSize={"Right", 5}}},
	--{ key = "v",  mods="SHIFT|CTRL", action="Paste"},
	--{ key = "h",  mods="LEADER",     action=wezterm.action{ActivatePaneDirection="Left"}},
	--{ key = "j",  mods="LEADER",     action=wezterm.action{ActivatePaneDirection="Down"}},
	--{ key = "k",  mods="LEADER",     action=wezterm.action{ActivatePaneDirection="Up"}},
	--{ key = "l",  mods="LEADER",     action=wezterm.action{ActivatePaneDirection="Right"}},
	{ key = "Enter", mods="ALT", action="ToggleFullScreen"},
    },
}

