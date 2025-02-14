local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor

return function(gdkmonitor)
	return Widget.Window({
		class_name = "bar",
		gdkmonitor = gdkmonitor,
		anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
		exclusivity = "EXCLUSIVE",
		Widget.CenterBox({
			class_name = "centerbox",
			margin_start = 10,
			margin_end = 10,
			margin_top = 5,
			center_widget = Widget.Box({
				Widget.Label({
					class_name = "box p-1",
					label = "Foo Bar",
				}),
			}),
		}),
	})
end
