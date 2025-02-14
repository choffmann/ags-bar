local scss = "./style.scss"
local css = "/tmp/style.css"
local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("widget.bar")
astal.exec(string.format("sass %s %s", scss, css))

local function main()
	local bars = {}

	for _, mon in pairs(App.monitors) do
		bars[mon] = Bar(mon)
	end

	astal.Variable:observe(App, "monitor-added", function(_, mon)
		bars[mon] = Bar(mon)
	end)

	astal.Variable:observe(App, "monitor-removed", function(_, mon)
		bars[mon]:destroy()
		bars[mon] = nil
	end)
end

App:start({
	css = css,
	request_handler = function(msg, res)
		print(msg)
		res("ok")
	end,
	main = main(),
})
