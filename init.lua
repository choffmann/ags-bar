local scss = "./style.scss"
local css = "/tmp/style.css"
local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("widget.bar")

astal.exec(string.format("sass %s %s", scss, css))

App:start({
	css = css,
	main = function()
		Bar(0)
		Bar(1)
	end,
})
