--[[ 
demonstrates  #, string.upper(), string.lower()
Lua 'syntactic sugar' with ':' instead of '.'

Python has a .title() function. LUA DOES NOT!
From http://lua-users.org/wiki/StringRecipes
	Change an entire string to Title Case (i.e. Capitalise The First Letter Of Each Word)
	Add extra characters to the pattern if needed. _ and ' are
	found in the middle of identifiers and English words.
	Also put %w_' into [%w_'] to make it handle normal and extra the same way.
	This also turns hex numbers into, eg. 0Xa7d4
	
	str = str:gsub("(%a)([%w_']*)", tchelper)

DO NOT CONCERN YOURSELF WITH HOW THESE FUNCTIONS WORK!
There are no errors in this code
]]
function tchelper(first, rest)
   return first:upper()..rest:lower()
end

function toTitle(Text) --converts any string to Title Case
	return Text:gsub("(%a)([%w_']*)", tchelper)
end

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	userInput = input("Type your name")
	-- # returns the length of the string
	print(userInput .. " has string.len("..userInput..") = " .. string.len(userInput) .. " characters in it")
	print(userInput .. " has ".. userInput ..":len() = " ..userInput:len() .. " characters in it")
	print(userInput .. " has #".. userInput .. " = ".. #userInput .. " characters in it")
	
	-- string.upper() converts all characters to UPPER CASE
	print(userInput .. " in upper case is string.upper("..userInput..") = ".. string.upper(userInput))
	print(userInput .. " in upper case is ".. userInput .. ":upper() = ".. userInput:upper())
	
	-- string.lower() converts all characters to lower case
	print(userInput .. " in lower case is string.lower(" ..userInput.. ") = ".. string.lower(userInput))
	print(userInput .. " in lower case is ".. userInput ..":lower() = ".. userInput:lower())
	
	print(userInput .. " in title case is ".. toTitle(userInput))
	print("\nDemonstration completed. Move to file '04-Numbers.lua'\n")
end

main()