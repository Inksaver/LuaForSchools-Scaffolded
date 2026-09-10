-- introduction to tables as dictionaries

local pp =
{
	WHITE = string.char(27)..'[37m',
	RED = string.char(27)..'[31m',
	GREEN = string.char(27)..'[32m',
	ORANGE = string.char(27)..'[33m',
	BLUE = string.char(27)..'[34m',
	MAGENTA = string.char(27)..'[35m',
	CYAN = string.char(27)..'[36m'
}
local completed = {false, false}

function pause()
	--[[ Asks the user to press Enter to continue running the program]]
	io.write(pp.GREEN.."Press Enter to continue")
	io.read()
end

function input(prompt)
    --[[ get input from user ]]
    io.write(prompt .. "_")
    return io.read()
end

function displayTable(tableName, tableData)
	print("Contents of "..tableName..":")
	-- note use of pairs NOT ipairs
	for key, value in pairs(tableData) do
		print("    key = " .. key .. ", value = "..value)
	end
	print("Note: the order of hash tables is not fixed. (lists are ordered)")
end

function tableContainsKey(tableData, key)
    --[[ checks if the dictionary type table contains the key specified. Returns true or false]]
	-- note use of pairs NOT ipairs
	for k, v in pairs(tableData) do
		if k == key then
			return true
		end
	end
	return false
end

function main()
    print()
	print([[Python has a dictionary dataType. Lua has a table instead:
    1. Python example:  colours = {{'first':'red'}, {'second':'green'}, {'third':'blue}}
    2. Lua example:     colours = {first = 'red', second = 'green', third = 'blue'})
    3. Lua alternative: colours = {['first'] = 'red', ['second'] = 'green', ['third'] = 'blue'}]])

    colours = {first = 'red', second = 'green', ['third'] = 'blue'} 	--create a table of colours using both syntaxes

	print("\n"..pp.GREEN.."Lua table values can be referenced by "..pp.WHITE.."table['"..pp.GREEN..'key'..pp.WHITE.."'] or table."..pp.GREEN.."key\n")
    print("print(colours)         : "..tostring(colours))        		-- table: 0x00698170 Yuk!
    print("print(colours['first']): "..colours['first'])              	-- 'red'
    print("print(colours.second)  : "..colours.second)              	-- 'green'
    print("print(colours.third)   : "..colours.third.."\n")             -- 'blue'
	
	pause()
	print("\nThere is a special 'for' loop used in hash tables\n")
	print(pp.ORANGE.."for key, value in pairs(table) do "..pp.WHITE.."-- Note "..pp.ORANGE.."(pairs) NOT (ipairs)")
	displayTable("colours", colours)
	
	pause()
	print([[Adding a new item to the table is more complex than adding to a list.
You need to add a suitable key for the item.
The colour items in the colours table have keys of 'first', 'second', 'third'
so suitable keys would be 'fourth', 'fifth' etc.
You can add the same colour more than once, but the key MUST be different.]])

--**********************************TASK 1 START CODE COMPLETION*************************************
	-- complete line 80 below, then un-comment lines 76, 80 to 85
--    completed[1] = true	-- internal progress tracker. Uncomment when this code section is complete
	if completed[1] then	-- this will only run if the first task has been completed
		colour = input(pp.CYAN.."Type a colour you want to add to the table"..pp.WHITE)
		key = input(pp.ORANGE.."Type the key you want to use for this colour"..pp.WHITE)
--		if <use a function from above that returns a boolean value> then
--			print("The table already contains the key "..key)
--		else
--			colours.key = colour
--			displayTable("colours", colours)
--		end
--**********************************END TASK 1 CODE COMPLETION*************************************
	else
		print("\n"..pp.GREEN.."Change the code to prevent adding a colour with the same key\n")
		print(pp.ORANGE.."Read the instructions on line 75\n")
	end
--**********************************TASK 2 START CODE COMPLETION*************************************
--    completed[2] = true	-- internal progress tracker. Uncomment when this code section is complete
	if completed[1] and completed[2] then	-- this will only run if both tasks have been completed
		colour = input(pp.CYAN.."Type a colour you want to add to the table"..pp.WHITE)
		key = input(pp.ORANGE.."Type the key you want to use for this colour"..pp.WHITE)
--		if tableContainsValue(?, ?) then
--			print("The table already contains the value "..colour)
--		else
--			colours[key] = colour
--			displayTable("colours", colours)
--		end
--**********************************END TASK 2 CODE COMPLETION*************************************
	elseif completed[1] then
		print("Copy the function "..pp.ORANGE.."tableContainsKey(tableData, key)")
		print("Rename it to "..pp.ORANGE.."tableContainsValue(tableData, value)")
		print("Change the code to look for a matching value instead of a matching key")
		print("Un-comment lines 92, 96 to 101. These line numbers will change!")
	end
end

main() -- program starts here