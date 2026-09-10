--[[
Logic errors: The code runs but does not work as expected
There are 5 logic errors.
Introduction of function main() to handle all code
Lua function: string.len(string) returns the length of a string
			example string.len("Hello World") = 11
			short version: #"Hello World"
			
Lua function: string.rep(string, number) returns a string repeated number times
			example string.rep("Hi", 4) = "HiHiHiHi"
			The number MUST be an integer eg 4 NOT 4.5
			
Lua integer divide //
9 / 2 = 4.5
9 // 2 = 4
]]

-- setup variables with default values
name = ""
age = 0
birthday = 0
top = 		"╔═ ══════════════════════════════════════╗"
blank = 	"║                                       ║"
bottom = 	"╚"..string.rep("═", 22).."╝"
divider = 	"─────────────────────────────────────────"

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function formatDisplay(text, align)
	--[[
	This function takes the given text and adds ║ and spaces to make it fit to 42 characters
	align = "║left    ║" "║   right║" "║  centre  ║" "║  center  ║"
	If 'align' is not passed as a parameter a default value of 'centre' is used
	There are no syntax or logic errors in this function.
	]]
	if align == nil then align = "centre" end	-- sets default if align is not supplied
	-- each line is 42 characters long with 2 UTF8 characters included
	-- find out how many spaces are needed: 40 - length of text
	spaces = (40 - string.len(text))
	-- spaces = (40 - #text)	-- alternative code
	if align == "centre" or align == "center" then
		return "║" .. string.rep(" ", spaces // 2)..text.. string.rep(" ", spaces // 2) .. "║"	-- spaces // 2 to centre the text
	elseif align == "left" then
		return "║" .. text.. string.rep(" ", spaces - 1) .. "║"									-- -1 to compensate for end ║
	else
		return "║" .. string.rep(" ", spaces - 1).. text .. "║"									-- -1 to compensate for start ║
	end
end

function main()
	--[[
	main() is often used for the central control of a program
	other functions are called from here
	]]
	
	-- display introduction
	
	print(blank)
	print(top)
	print(formatDisplay("Welcome to data collection app!", "centre"))
	print(blank)
	print("bottom")
	print()
	
	-- now get personal data
	print(divider)
	name = input("Please type your first name")
	age = input("How old are you?")
	birthday = input("What month is your birthday? (1 to 12)")
	
	print()	
	print(divider)
	print(top)
	print(blank)
	print(formatDisplay("Thank you for sharing your data", "centre"))
	print(formatDisplay("It will now be sold to scam websites.", "centre"))
	print(blank)
	print(bottom)
	print()
	
	print("This is what we know about you:\n")
	print(top)
	print(blank)
	print(formatDisplay(" Name:          ".. age, "left"))
	print(formatDisplay(" Age:           ".. name, "left"))
	print(formatDisplay(" Birth Month:   ".. birthday, "left"))
	print(blank)
	print(bottom)
	
	print("\nSection 01-IO completed. Move to folder '02-Variables'\n")
end

main()								-- program starts here