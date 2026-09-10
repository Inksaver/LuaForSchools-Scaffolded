--[[
for loops run a fixed number of times
for index = start, end, step do

eg for i = 1, 6, 1 do
start at i = 1,
step by 1 so i = i + 1
repeat until i = 6

eg for i = 6, 1, -1 do
start at i = 6,
step by -1 so i = i - 1
repeat until i = 1
There are 2 syntax errors
]]

function sleep(s) 
    --[[
	Lua version of Python time.sleep(0.5) 
	Uses a while loop to count down time
	]]
	local sec = tonumber(os.clock() + s); 
    while (os.clock() < sec) do end 
end

function display(direction, count, ascending, interval)
	-- parameter checks. Use default values if missing
	if direction == nil then direction = "h" 	end
	if count == nil 	then count = 5 			end
	if ascending == nil then ascending = true 	end
	if interval == nil 	then interval = 1 			-- lua:114: 'end' expected (to close 'function' at line 25) near <eof>
	
	print()									-- add empty line
	if direction == "h" then				-- horizontal output
		if ascending then					-- count up
			for index = 1, count do			-- index from 1 to count, step 1
				io.write(index .. " ")		-- write the index no  + space
				sleep(interval)				-- pause for interval seconds
			end
		else								-- count down			
			for index = count, 1, -1 do		-- index from count to 1, step -1	
				io.write(index .. " ")		-- write the index no  + space
				sleep(interval)				-- pause for interval seconds
			end
		end
	else									-- vertical output
		if ascending then					-- count up
			for index = 1, count do			-- index from 1 to count, step 1
				print(index)				-- print the index and newline
				sleep(interval)				-- pause for interval seconds
			end
		else
			for index = count, 1, -1 do		-- index from count to 1, step -1	
				print(index)				-- print the index and newline
				sleep(interval)				-- pause for interval seconds
			end
		end
	end
	print()
end

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

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

function main()
	print()
	-- get how many numbers to display
	Count = getNumber("How many numbers do you want to display?")
	-- limits excess numbers entered to 20
	if count > 20 then count = 20 end					-- lua:87: attempt to compare number with nil
	
	-- get horizontal or vertical display direction
	direction = input("Display output horizontal (h) or vertical(v)?")
	if direction:lower():find("v") == nil then			-- is 'v' in the user choice?
		direction = "h"
	else
		direction = "v"
	end
	
	-- count up or down?
	ascending = input("count up (u) or down (d)?")		-- lua:69: unfinished string near '"count up (u) or down (d)?))'
	if ascending:lower():find("d") == nil then			-- is 'd' in the user choice?
		ascending = true
	else
		ascending = false
	end
	
	-- get delay between ouputting each number
	interval = getNumber("How long before the next number is displayed? (0.1 to 5)?")
	if interval > 5 then interval = 5 end				-- limits max interval to 5 secs
	
	-- output the numbers
	display(direction, count, ascending, interval)		-- eg display("v", 7, true, 0.75)
	
	print("\nCode completed. Move to file '03-Repeat.lua'\n")
end

main()