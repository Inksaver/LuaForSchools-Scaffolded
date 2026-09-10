--[[
Introduction to tables used as a list
No errors in this code
Changes need to be made for full function
]]

-- internal tables used to track progress
local completed = {false, false}
-- ANSI colours, this time held in a table
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

function input(prompt)
    --[[ get input from user ]]
    io.write(prompt .. "_")
    return io.read()
end

function pause()
	--[[ Asks the user to press Enter to continue running the program]]
	io.write(pp.GREEN.."Press Enter to continue")
	io.read()
end	

function displayTable(tableName, tableData)
	--[[ Displays the contents of the list ]]
	print("\nContents of "..pp.GREEN..tableName..":")
	for key, value in ipairs(tableData) do
		print("    key = " .. key .. ", value = "..value)
	end
end

function removeFromList(tableData, item)		
	--[[ Removes an item from the list ]]
	for key, value in ipairs(tableData) do
		if value == item then
			return table.remove(tableData, key)
		end
	end
	return nil
end

function listContains(table, value)
    --[[ checks if the table contains the value specified. Returns true or false
	ONLY WORKS ON LISTS]]
	for k, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

function main()
	print()
	print([[Python has a list dataType. Lua uses a table instead:
		
    1. Python example: colours = ['red', 'green', 'blue']
    2. Lua example:    colours = {'red', 'green', 'blue'}]])

    colours = {"red", "green", "blue"} 						--create a table of colours
    print()
    print("print(colours):    "..tostring(colours))        	-- table: 0x00698170 Yuk!
    print("print(colours[1]): "..colours[1])              	-- 'red'
    print("print(colours[2]): "..colours[2])              	-- 'green'
    print("print(colours[3]): "..colours[3])              	-- 'blue'
    print("\nprint(table.concat(colours, ', ')): \t"..table.concat(colours, ", ")) -- 'red, green, blue'
	print()
	pause()
	print("You can get the contents of the table with a for loop:")
	for index = 1, #colours do								-- normal for loop uing indices: LUA INDEX STARTS AT 1 NOT 0!
		print("    "..index.." = " .. colours[index])
	end
	
	print("There is a special 'for' loop used in tables")
	print("for key, value in ipairs(table) do")
	displayTable("colours", colours)
	
	colour = input(pp.CYAN.."Type a colour you want to add to the table"..pp.WHITE)
	table.insert(colours, colour)
	displayTable("colours", colours)
	--**********************************TASK 1 START CODE COMPLETION*************************************
	-- complete line 94 below, then un-comment lines 91, 94 to 99
--    completed[1] = true	-- internal progress tracker. Uncomment when this code section is complete
	if completed[1] then	-- this will only run if the first task has been completed
		colour = input("Type a colour ALREADY in the table")
--		if <use a function from above that returns a boolean value> then	-- You have to do some typing here. Shock! Horror!
--			print("The table already contains the colour "..colour)
--		else
--			table.insert(colours, colour)
--			displayTable("colours", colours)
--		end
	--**********************************END CODE COMPLETION*************************************
	else
		print("\n"..pp.ORANGE.."Change the code to prevent adding the same colour twice")
		print(pp.ORANGE.."Read the instructions on line 78\n")
	end

	--**********************************TASK 2 START CODE COMPLETION*************************************
	-- complete line 111 below, then un-comment line 108
    --completed[2] = true	-- internal progress tracker. Uncomment when this code section is complete
	if completed[2] then	-- this will only run if the second task has been completed
		colour = input("Which colour do you want to remove?")
		-- removed = <use a function from above that removes a table item and returns the item or nil>
		if removed == nil then
			print(colour.." was not found in the list")
		else
			print(removed.." has been removed from the list")
			displayTable("colours", colours)
		end
	else
		print("\n"..pp.ORANGE.."Change the code to allow removing a colour from the list")
		print(pp.ORANGE.."Read the instructions on line 103\n")
	end
end

main() -- program starts here