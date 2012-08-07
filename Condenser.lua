--Overengineered Button to use at our condenser :)
--Copyright (C) 2012  Auke Bakker
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


__author__="aacoba, boisei0"

function Startup()
 term.clear()
 term.setCursorPos(1,1)
 print("Welkom bij de condenser!")
 print("Author: " .. __author__)
end

function defineSettings()
 item1="Iron"
 item2="Diamond"
 item3="GoldBlock"
 item1emc=96
 item2emc=8192
 item3emc=18432
 cable="back"
 slowmode=false
end

function itemStats()
 print("Beschikbare items zijn: ")
 print(item1 .. " " ..item1emc .. " EMC")
 print(item2 .. " " ..item2emc .. " EMC")
 print(item3 .. " " ..item3emc .. " EMC")
end

function cleanUp()
 sleep(3)
 term.clear()
 term.setCursorPos(1,1)
end

function slowmodeWait()
 if slowmode then
  sleep(2)
  else
  sleep(1)
 end
end

function  reqItem1()
 print("Sending " .. item1 .. " your way!")
 redstone.setBundledOutput(cable, colors.blue)
 slowmodeWait()
 redstone.setBundledOutput(cable, 0)
end

function reqItem2()
 print("Sending " .. item2 .. " your way!")
 redstone.setBundledOutput(cable, colors.white)
 slowmodeWait()
 redstone.setBundledOutput(cable, 0)
end

function reqItem3()
 print("Sending " .. item3 .. " your way!")
 redstone.setBundledOutput(cable, colors.red)
 slowmodeWait()
 redstone.setBundledOutput(cable, 0)
end


function printMenu()
 print("1. Request " .. item1 .. " " .. item1emc .. " EMC")
 print("2. Request " .. item2 .. " " .. item2emc .. " EMC")
 print("3. Request " .. item3 .. " " .. item3emc .. " EMC")
end

function menuVerwerking()
 keuze = read()
 if keuze == "1" then
  reqItem1()
 elseif keuze == "2" then
  reqItem2()
 elseif keuze == "3" then  
   reqItem3()
 elseif keuze == "kiwi" then
 exit()
 else 
 print("Onbekende keuze! :<")
 return
 end
end

function menu()
 while true do 
  printMenu()
  menuVerwerking()
  
  if slowmode then
	sleep(5)
	else
	sleep(1)
   end
  term.clear()
  term.setCursorPos(1,1)
 end 
end 



Startup()
defineSettings()
itemStats()
cleanUp()
menu()