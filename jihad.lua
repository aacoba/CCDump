distanceOrder=16 --Blocks to target
suicice=0 --Suicidal turtle?
slowmode=0 --Wait 2 sec before blowing up the charge

function detect() --Detect if there is a block in front
	if turtle.detect() then
	turtle.dig()
	end
end

function forward() --Move forward + count up to distance counter
	detect()
	turtle.forward()
	distance = distance + 1
end

function jihad() --Places and blows up the charge
	turtle.back()
	turtle.select(1)
	turtle.place()
	slowmode()
	rs.setOutput("front", true)
	RUN()
end

function RUN() --Determains if turtle needs to run away or commit suicice
	if suicide == 1 then
		print("OELEOELEOELEOELEOELEOELEOELEO")
		sleep(2)
		os.shutdown()
	else
		turtle.back()
		turtle.back()
		turtle.back()
		while true do
			turtle.back()
		end
	end
end

function checkDistance() --Checks if the target has already been reached
	if distance >= distanceOrder then
	jihad()
	else
	complete=false
	end
end

function slowmode() --Pauzes the script for 2 second if slowmode is active
	if slowmode == 1 then
		sleep(2)
	end
end
	
function main() --Main startup function
	activate()
	distance=0
	complete=false
	while complete ~= true do
		forward()
		checkDistance()
	end
end

function activate() --Detect redstone activation
	print("Place a redstone source behind the turtle and power it up!")
	while not(redstone.getInput("back")) do
		sleep(1)
	end
end


main()