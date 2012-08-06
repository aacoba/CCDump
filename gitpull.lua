__name__="Github pull"
__version__="0.1"
__author__="aacoba"

local tArgs = {...}

function welcome()
	print(__name__ .. " " .. __version__ .. " By: " .. __author__)
	if GlaDOS then
	textutils.slowPrint([[

               .,-:;//;:=,
           . :H@@@MM@M#H/.,+%;,
	,/X+ +M@@M@MM%=,-%HMMM@X/,
      -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
     ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
   ,%MM@@MH ,@%=            .---=-=:=,.
   =@#@@@MX .,              -%HX$$%%%+;
  =-./@M@M$                  .;@MMMM@MM:
  X@/ -$MM/                    .+MM@@@M$
 ,@M@H: :@:                    . =X#@@@@-
 ,@@@MMX, .                    /H- ;@M@M=
 .H@@@@M@+,                    %MM+..%#$.
  /MMMM@MMH/.                  XM@MH; =;
   /%+%$XHH@$=              , .H@@@@MX,
    .=--------.           -%H.,@@@@@MX,
    .%MM@@@HHHXX$$$%+= .:$MMX =M@@MM%.
      =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
        =%@M@M#@$-.=$@MM@@@M; %M%=
          ,:+$+-,/H#MMMMMMM@= =,
                =++%%%%+/:-.
]])
	end
end

function inputdecoder()
	filename = tArgs[1]
	GlaDOS = false
end

function help()
	print("Usage: ")
	print("ccdump filename")
end

function parameterCheck()
	if #tArgs > 1 then
		Print("To many parameters!")
		help()
	end
end

function get()
	local response = http.get(
		"http://cloud.mwas.nl/CCDump/Stable/"..filename
		)
		
		if response then
			
			if GlaDOS then 
					textutils.slowPrint([[
										Download Complete!
										This was a triumph.
										I'm making a note here: HUGE SUCCESS.
										]])
			else
					textutils.slowPrint("Download Complete!")
			end
		
		local sResponse = response.readAll()
		response.close()
		
		local file = fs.open(filename, "w")
		file.write( sResponse)
		file.close()
			
		else
				textutils.slowPrint("Download failed!")
				help()
		end
end

function main()
	inputdecoder()
	welcome()
	get()
end

main()
