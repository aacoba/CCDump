__name__="Airlock Control + Auth System"
__version__="0.1"
__author__="aacoba"

function welcome()
	print(__name__ .. " " .. __version__ .. " By: " .. __author__)
end

function localSettings()
	bottomCable="left"
	topCable="Right"
	insLocation="http://game.aacoba.net/Mercury/.Instructions/"
	insfile="airlock"
end
	

function openBottom()
	rs.setOutput(bottomCable, true)
end

function closeBottom()
	rs.setOutput(bottomCable, false)
end

function openTop()
	rs.setOutput(topCable, true)
end

function closeTop()
	rs.setOutput(topCable, false)
end

function getInstruction()
	local sInstruction = http.get(insLocation .. insfile)
	ins = sInstruction.readAll()
	sInstruction.close()
end

function runIns()
	ins()
end

welcome()
localSettings()
getInstructions()
runIns()