local app_icons = require("helpers.app_icons")
local colors = require("colors")
local settings = require("settings")

local item_order = ""

sbar.exec("aerospace list-workspaces --monitor focused", function(spaces)
  for space_name in spaces:gmatch("[^\r\n]+") do
    print("space name: " .. space_name)
    local space = sbar.add("item", "space." .. space_name, {
      icon = {
        font = { family = settings.font.numbers, size = 15 },
        string = space_name,
        padding_left = 7,
        padding_right = settings.group_paddings,
        color = colors.white,
        highlight_color = colors.bg2,
        background = { height = 28, corner_radius = 6 },
        y_offset = 1,
      },
      label = {
        padding_right = 12,
        color = colors.grey,
        highlight_color = colors.white,
        font = "sketchybar-app-font:Regular:16.0",
        y_offset = -1,
      },
      padding_right = 1,
      padding_left = 1,
      background = {
        color = colors.item_bg_color,
        border_width = 0,
        border_color = colors.black,
        -- highlight_color = colors.bg1,
      },
    })

    space:subscribe("mouse.clicked", function()
      sbar.exec("aerospace workspace " .. space_name)
    end)

    -- use aerospace_workspace_change space_windows_change
    space:subscribe("aerospace_workspace_change", function(env)
      local selected = env.FOCUSED_WORKSPACE == space_name
      space:set({
        icon = {
          highlight = selected,
          background = { color = selected and colors.mauve or colors.item_bg_color },
        },

        label = { highlight = selected },
      })
    end)
  end
  sbar.exec("sketchybar --reorder " .. item_order .. " front_app")
end)
