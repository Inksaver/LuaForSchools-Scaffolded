--[[
New Lua function tostring(variable)	returns the string equivalent of the variable

Lua function string.lower()
string.lower("ABC") = "abc"

using 'syntactic sugar':
("ABC"):lower() = "abc" ("ABC" has to have brackets round it as it is text.)
name = "Fred"
name:lower() = "fred"	 variable does not need brackets round it

This code demonstrates boolean variables
There are 2 syntax errors
]]

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- Boolean variables can only be either true or false
	-- Most languages associate true = 1, false = 0
	-- You can also think of yes = true, no = false

	choice = false -- variable called 'choice' is given the default value false
	print("\nA variable called 'choice' has been assigned the value: "..tostring(choice))

	userInput = input("Do you like Lua? (y/n)")
	-- user SHOULD have typed a 'y' or 'n'
	if userInput == "" then								-- Enter only
		print("You only pressed the Enter key")
	-- 'y' or 'Y' typed in (using shorter syntax)
	elseif userinput:lower() == 'y' then				-- lua:26: attempt to index global 'userinput' (a nil value)
		print("Great! re-assigning variable choice...")
		choice = true									-- set choice to true as the user typed 'y'
	-- 'n' or 'N' typed in (using full syntax)
	elseif string.lower(input) == 'n' then				-- lua:31: bad argument #1 to 'lower' (string expected, got function)
		print("Oh. That is disappointing")
	else												-- some other characters typed in
		print("You typed '"..userInput.."' I can't translate that to true/false")
	end
	
	if choice then
		print("The variable 'choice' has been assigned the value: "..tostring(choice))
	else
		print("The variable 'choice' has not changed")
	end
	print("\nCode completed. Move to file '03-String.lua'\n")
end

main()