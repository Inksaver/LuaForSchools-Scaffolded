--[[
The while loop is used if it needs to run for an unknown number of times.
Here, the getNumber function runs a loop infinitely (true is always true)
If the user enters a number, the return keyword on line 17 breaks the loop

There are 2 syntax errors and 1 logic error (Not in the function getNumber)
]]
function getNumber(prompt)
	--[[similar to the input function, but ensures only numeric values are returned]]
	while true do
		io.write(prompt.."_")
		local userInput = io.read()
		if userInput == "" then
			print("\nJust pressing the Enter key doesn't work...")
		else
			if tonumber(userInput) ~= nil then
				return tonumber(userInput)
			else
				print("\nTry entering a number - "..userInput.." does not cut it...")
			end
		end
	end
end

function Main()
	age = getnumber("Type your age")				-- lua:24: attempt to call a nil value (global 'getnumber')
	age = math.floor(age)
	if age < 18 then
		print("You are an adult aged ".. age)
	else
		print("You are not an adult, aged "..age)
	end
	
	print("\nCode completed. Move to file '02-ForLoop.lua'\n")
end

main()	-- lua:33: attempt to call a nil value (global 'main') Hint: where is main()? upper/lower case matters