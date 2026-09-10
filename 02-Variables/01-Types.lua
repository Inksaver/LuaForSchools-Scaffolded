-- New Lua function string.find(searchIn, searchFor) returns nil if no match, else position of match
-- New Lua function string.lower(text) returns text in lower case
--[[
Variables are memory locations containing data
In Lua they have an identifier and a type
Example: name = "Fred"
identifier:	name
value:		"Fred"
type:		string

Example: height = 500
identifier:	height
value:		500
type:		number (Lua does not have separate integer / floating point numbers)

Example: verified = true
identifier:	verified
value:		true
type:		boolean (Only 2 values possible: true or false)

This code has 3 syntax errors
This code has 1 logic error regarding authorisation
]]

-- declare some variables
name = "Fred"
height = 1.6
authorised = false

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- Anything typed in is a string, INCLUDING numbers!
	-- Ask the user to type something, and store what they typed.
	print([[My personal details are:
		
	name = "Fred"
	height = 1.6
	authorised = false
	
	Let's see if we have any matching data...
	]])
	
	userInput = Input("My name is Fred. What is yours?")	-- lua:46: attempt to call global 'Input' (a nil value)
	if userInput == "Fred" then								-- same name
		print("Your name is the same as mine!")
		authorised = true									-- change authorisation status
	elseif string.lower(userInput) == "fred" then
		print("Your name is almost the same as mine, but you used 'f' instead of 'F'")
		authorised = true									-- change authorisation status
	elseif string.find(userInput, "fred") ~= nil then
		print("Your name " .. userInput .. " has my name in it!")
	else
		print("Your name is " + userInput + ", mine is " + name)	-- lua:56: attempt to perform arithmetic on a string value
	end
	-- Ask the user to enter only numbers
	userInput = input("I am 1.6m tall. How tall are you? (numbers and decimal point only)")
	if tonumber(userInput) == nil then					-- cannot be converted
		print("You did not enter a number! ("..userInput..")!")
		authorised = false								-- reset authorisation
	else												-- can be converted to a number
		userInput = tonumber(userInput)					-- re-assign the string variable to a number variable
		if userInput = 1.6 then							-- lua:65: 'then' expected near '='
			print("Your height is the same as mine!")
		elseif userInput < 1.6 then						-- less than 1.6
			print("You are not as tall as me!")
			authorised = false							-- reset authorisation
		elseif userInput > 1.6 then						-- greater than 1.6
			print("You are taller than me!")
			authorised = false							-- reset authorisation
		end
	end
	
	if not authorised then 
		print("You are authorised to access my bank account!")
	else
		print("Authorisation failed. Access denied")
	end
	print("\nCode completed. Move to file '02-Boolean.lua'\n")
end

main()