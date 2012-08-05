--ComputerCraft script to dig a hole and return what was found to the surface
--Copyright (C) 2012  Lennart Buit
--
--This program is free software; you can redistribute it and/or
--modify it under the terms of the GNU General Public License
--as published by the Free Software Foundation; either version 2
--of the License, or (at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program; if not, write to the Free Software
--Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


--Place a mining turtle loaded with this scipt
--Place a block above the turtle, doesnt matter what
--Place a wooden pipe, with redstone engine behind the turtles
--The turtle will dig a hole to the right
--Unless goLeft in doMove is initialised to true

local size = 8

function getTotalItemCount()
    local count = 0
    for z=1,9 do
        count = count + turtle.getItemCount(z)
    end
    return count
end

function safeForward()
    local forward = false
    while(not forward) do
        forward = turtle.forward()
    end
end

function doMove()
    local goLeft = false
    turtle.dig()
    safeForward()
    
    --We staan nu op het punt aan het begin van het zigzag patroon
    for x = 1, size-1 do
        for y = 1, size-2 do
            turtle.dig()
            safeForward()
        end
        if(goLeft) then
            turtle.turnLeft()
            turtle.dig()
            safeForward()
            turtle.turnLeft()
            goLeft = false
        else
            turtle.turnRight()
            turtle.dig()
            safeForward()
            turtle.turnRight()
            goLeft = true
        end
    end
    --Laatste keer hoeven we niet te draaien
    for i = 1, size-1 do
        turtle.dig()
        safeForward()
    end
    
    if(goLeft) then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
    
    for j = 1, size-1 do
        turtle.dig()
        safeForward()
    end

    if(goLeft) then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
end

function main()
    while(not turtle.detectDown()) do
        turtle.down()
    end

    turtle.digDown()
    turtle.down()
    doMove()

    while(not turtle.detectUp()) do
        turtle.up()
    end

    while(getTotalItemCount() > 0) do
        sleep(1)
    end
end

if(not (size % 2 == 0)) then
    size = size + 1
end

while(true) do
    main()
end


    
