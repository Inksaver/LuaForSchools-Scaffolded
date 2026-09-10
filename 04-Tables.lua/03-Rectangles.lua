--[[
https://www.w3schools.com/charsets/ref_utf_box.asp
utf8 box characters stored here for easy copy/paste:

┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
]]
local pp =
{
	--[[table of colours that Zerobrane is able to display in the output window
		These are ANSI escape characters that work in Windows 11 and all Linux distributions]]
	WHITE = string.char(27)..'[37m',
	RED = string.char(27)..'[31m',
	GREEN = string.char(27)..'[32m',
	ORANGE = string.char(27)..'[33m',
	BLUE = string.char(27)..'[34m',
	MAGENTA = string.char(27)..'[35m',
	CYAN = string.char(27)..'[36m'
}

local style = {}	-- create an empty table populated in populate()
local rect = {} 	-- create an empty table populated in populate()

local function sleep(s) 
	--[[ mimics Python time.sleep() ]]
	local sec = tonumber(os.clock() + s); 
    while (os.clock() < sec) do end 
end

local function populate()
	--[[ populate the rect and style tables  ]]
	style.fill = {}						-- empty sub-table for all fill type characters
	style.fill.topbottom = "═"			-- character for top and bottom of the rectangle
	style.fill.side = "║"				-- character for rectangle side
	style.fill.corner = {}				-- sub-table of style.fill for corner characters
	style.fill.corner.topleft = "╔"		-- corner characters
	style.fill.corner.topright = "╗"
	style.fill.corner.bottomleft = "╚"
	style.fill.corner.bottomright = "╝"
	
	style.line = {}						-- empty sub-table for all line type characters
	style.line.topbottom = "─"
	style.line.side = "│"
	style.line.corner = {}
	style.line.corner.topleft = "┌"
	style.line.corner.topright = "┐"
	style.line.corner.bottomleft = "└"
	style.line.corner.bottomright = "┘"
	
	rect.X = 0                    	-- set X value to 0
    rect.Y = 0                    	-- set Y value to 0
    rect.Width = 2               	-- set Width to 2
    rect.Height = 2               	-- set Height to 2
    rect.Colour = pp.WHITE			-- set colour to default white
    rect.Mode = "line"            	-- set draw mode to "line" (alternative is "fill")
	rect.Expands = false			-- rectangle gets wider as it moves
	rect.Frames = 5					-- how many frames are drawn
	rect.FPS = 1					-- sleep() interval
    -- Lua tables can also contain functions
	function rect.moveHorizontal(pixels)
        rect.X = rect.X + pixels  	-- add no of pixels to X position
    end
    function rect.changeWidth(pixels)
        rect.Width = rect.Width + pixels -- add no of pixels to Width
    end
end

local function input(prompt, dataType) 	-- get input from user
	--[[ dataType should be "str", "int", "float" or "bool" ]]
	dataType = dataType or "str" 		-- if not supplied then give default value
	while true do						-- break not required as return used instead
		io.write(prompt .. "_")
		local userInput = io.read()
		if dataType:lower():find("str") ~= nil then
			return userInput
		elseif dataType == "int" or dataType == "float" then
			if tonumber(userInput) ~= nil then
				if dataType == "int" then
					return math.floor(tonumber(userInput))
				else
					return tonumber(userInput)
				end
			else
				print("Enter a number ".. userInput .. " does not work")
			end
		elseif dataType == "bool" then
			if userInput:lower():find("y") ~= nil then
				return true
			elseif userInput:lower():find("n") ~= nil then
				return false
			else
				print("Enter y or n ".. userInput .. " does not work")
			end
		end
	end
end

local function menu(title, list) -- displays a menu using the text in 'title', and a list of menu items (string)
	index = 1
	print(title)
	for _, item in ipairs(list) do
		print("\t"..index..") "..item)
		index = index + 1
	end
	return input("Type the number of your choice (1 to "..index-1 ..")", "int")
end

local function update()
    --[[ increase the X position and / or Width ]]
	if rect.Expands then
		rect.changeWidth(1)
	end
    rect.moveHorizontal(2)
end

function rect.draw()
    --[[ draw rectangle using rect.X as the starting x coordinate ]]
	local x = (" "):rep(rect.X)             			-- string of spaces equivalent to position of X "" -> "     "
	
	local top = style[rect.Mode].corner.topleft..
				style[rect.Mode].topbottom:rep(rect.Width - 2)..
				style[rect.Mode].corner.topright		-- rectangle top	"┌──────────┐"
    
	local width = style[rect.Mode].side..
				(" "):rep(rect.Width - 2)..
				style[rect.Mode].side					-- rectangle sides	"│          │"
				
	local bottom = style[rect.Mode].corner.bottomleft..
				   style[rect.Mode].topbottom:rep(rect.Width - 2)..
				   style[rect.Mode].corner.bottomright	-- rectangle bottom	"└──────────┘"
	
	print(rect.Colour..x..top)                         	-- print top of rectangle with spaces "     ┌──────────┐"
    for rows = 1, rect.Height - 2 do        			-- loop: height of rectangle minus top and bottom
        print(rect.Colour..x..width)           			-- print sides of rectangle           "     │          │"
    end
    print(rect.Colour..x..bottom)                       -- print bottom of rectangle          "     └──────────┘"
end

local function main()
    populate()	-- populate the tables rect and style
	-- get user preference of colour
	displayList = {pp.WHITE.."WHITE", pp.RED.."RED", pp.MAGENTA.."MAGENTA", pp.ORANGE.."ORANGE", pp.GREEN.."GREEN", pp.BLUE.."BLUE", pp.CYAN.."CYAN"}
	colourList = {"WHITE", "RED", "MAGENTA", "ORANGE", "GREEN", "BLUE", "CYAN"}
	-- menu returns an integer, the index of the chosen list item
	-- displayList is used as it contains ANSI colour codes
	index = menu("\nWhat colour do you want to use?", displayList )
	-- colourList is used as it contains only the colour required eg "RED"
	rect.Colour = pp[colourList[index]]	-- eg index chosen is 2, colourList[2] = "RED", pp["RED"] = pp.RED = ANSI code for red
	
	mode = input("\n"..pp.GREEN.."What drawing mode do you want (fill or line)"..pp.WHITE)
	if mode:lower() == "fill" then
		rect.Mode = "fill"
	elseif mode:lower() == "line" then
		rect.Mode = "line"
	else
		print(pp.GREEN.."Unable to find mode "..mode..", using 'line'"..pp.WHITE)
	end
	
	-- get the width
	width = input("\n"..pp.GREEN.."How wide do you want the rectangle (2 to 10)"..pp.WHITE, "int")
	if width < 2 then width = 2 end
	if width > 10 then width = 10 end
	rect.Width = width
	
	-- get the height, re-using same variable
	width = input("\n"..pp.GREEN.."How tall do you want the rectangle (2 to 6)?"..pp.WHITE, "int")
	if width < 2 then width = 2 end
	if width > 10 then width = 10 end
	rect.Height = width
	
	expand = input("\n"..pp.GREEN.."Do you want the rectangle to get wider as it moves? (y/n)"..pp.WHITE, "bool")
	if expand then
		rect.Expands = true
	end
	
	width = input("\n"..pp.GREEN.."How many frames to draw (5 to 25)?"..pp.WHITE, "int")
	if width < 5 then width = 5 end
	if width > 25 then width = 25 end
	rect.Frames = width
	
	width = input("\n"..pp.GREEN.."How long between frames (0.5 to 5)"..pp.WHITE, "float")
	if width < 0.5 then width = 0.5 end
	if width > 5 then width = 5 end
	rect.FPS = width
	
    for frames = 1, rect.Frames do
		sleep(rect.FPS)
        update()                  	-- update values of rect.X and rect.Width
        rect.draw()               	-- draw updated rectangle
    end
end

main()