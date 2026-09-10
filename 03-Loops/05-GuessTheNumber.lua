--[[
Introducing the keyword 'local'
It is recommended to use it where possible to speed up applications and
prevent variable name errors on larger projects

The input function has been expanded to ensure the correct dataType is returned:
string, int, float or boolean

The code has no errors
Your mission is to improve the game
]]

-- ANSI colour codes
WHITE = string.char(27)..'[37m'
RED = string.char(27)..'[31m'
GREEN = string.char(27)..'[32m'
ORANGE = string.char(27)..'[33m'
BLUE = string.char(27)..'[34m'
MAGENTA = string.char(27)..'[35m'
CYAN = string.char(27)..'[36m'

local function input(prompt, dataType) 	-- get input from user
	--[[ dataType should be "str", "int", "float" or "bool" ]]
	dataType = dataType or "str" 	-- if not supplied then give default value
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

local function main()
	--[[
	Modify the code below to give helpful guidance of the range of numbers remaining.

	Hints:

	The 2 variables closestAbove and closestBelow hold the largest and smallest numbers guessed so far.
	Re-assign these variables as guesses are made
	When asking for a guess, incorporate these variables to help the user narrow their choice.
	
	]]
	math.randomseed(os.time())			-- set the random seed
	local number = math.random(1, 99)	-- pick a number between 1 and 99
	local closestAbove = 99				-- use these variables to improve the game output
	local closestBelow = 1
	repeat
		local guess = input("\n"..ORANGE.."Enter an integer from 1 to 99"..WHITE, "int")
		if guess < number then
			-- if the guess is greater than the current closestBelow
			-- then change the value of closestBelow
			-- alter the print statement to show the current closestBelow and closestAbove values
			print(guess .. CYAN.. " is too low")
		elseif guess > number then
			-- if the guess is less than the current closestAbove
			-- then change the value of closestAbove
			-- alter the print statement to show the current closestBelow and closestAbove values
			print(guess.. MAGENTA.." is too high")
		else
			print(GREEN.."you guessed it!")
		end
	until guess == number
	print()
	print([[It would be helpful if the program guided you to choose a number
between the failed upper and lower guesses.
There are hints in the main() function comments to help you achieve this]])
	print()
end

main()