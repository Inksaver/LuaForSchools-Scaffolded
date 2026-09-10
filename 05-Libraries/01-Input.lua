--[[
Lua can use code libraries, similar to Python's import function
When running from ZeroBrane you may have to specify where they can be found
Lines 6 and 7 add the directory of the project code to the source
This works in both Windows and Linux
]]
local cwd = (debug.getinfo(1, "S").source):match("^@(.+[\\/])"):gsub("\\", "/")
package.path = cwd.."?.lua;"..cwd .."?/init.lua;"..package.path

-- import the kboard.lua library from /lib/kboard.lua
local kb = require("lib.kboard")


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

local function testKboard()
	print("\nThis program demonstrates the use of a greatly expanded keyboard input library")
	print("It is called 'kboard.lua' in a separate folder called 'lib'")
	print("It guarantees getting a specific dataType from the user (string, int, float, bool)")
	print("It also has a menu and sleep functions\n")
	print(pp.ORANGE.."Try and break it by typing all the wrong things, or just pressing enter\n")
	kb.pause(pp.GREEN.."Press Enter to continue")
	local name = kb.getString(pp.ORANGE.."What is your name?", true, 3, 6)
	print("User name : "..name..pp.CYAN.." <- See how I used a capital letter!")

	local age = kb.getInteger(pp.ORANGE.."How old are you?", 5, 110)
	print("User age : ".. age.. " years old.")
	
	local height = kb.getFloat(pp.ORANGE.."How tall are you?", 0.5, 2.0)
	print("User height : ".. height.." metres tall.")
	
	local likesLua = kb.getBoolean(pp.ORANGE.."Do you like Lua? (y/n)")
	print("User likes Lua : "..tostring(likesLua))
	kb.sleep(2)					-- pause 2 secs
	
	local title = "\nWhat do think of this utility?"
	local options = {"Brilliant", "Not bad", "Could do better", "Rubbish"}
	local choice = kb.menu(title, options)
	print(name.." thinks this utility is : "..pp.MAGENTA..options[choice])
end

local function main()
	--[[ Everything runs from here ]]
	testKboard()
end
main()