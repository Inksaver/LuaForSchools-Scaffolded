--[[
Drawing pyramids

     *
    ***
   *********
  ***********
 *************  
***************  

	This example is 6 rows deep. You could do this in a number of ways:
	1. Lazy: write 6 string variables with the correct layout, then print them: 1 mark!
	
	2. Better: create 6 string variables using code to fill them, then print them: 2 marks!
	   (you could use a combination of string.rep() and concatenation -> .. )
	   eg row1 = string.rep(" ", 4) .. "*" .. string.rep(" ", 4)
	   
	3. Best: Use a for loop to draw the tree one row at a time similar to 2.
	   (join the string.rep(" " ,#) and string.rep("*", #) combinations in the for loop)
	   but able to cope with as many rows as the user chooses: 10 marks!
]]

GREEN = string.char(27).."[32m"	-- ANSI codes to alter output colour (only 7 available in ZeroBrane 31 to 37)
ORANGE = string.char(27).."[33m"

function pause()
	--[[ asks the user to press Enter to continue. The output is green
	     as an ANSI code is injected into the io.write function]]
	io.write(GREEN.."Press Enter to continue")
	io.read()
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

function lazy()
	print("\nDemonstration of lazy (fixed at 6 rows):\n")
	-- these variables can be written in any order
	row1 = "     *     "
	row2 = "    ***    "
	row3 = "   *****   "
	row4 = "  *******  "
	row5 = " ********* "
	row6 = "***********"
	-- the shape of the pyramid is affected by the order the rows are printed
	print(row1)
	print(row2)
	print(row3)
	print(row4)
	print(row5)
	print(row6)
end

function better()
	print("\nDemonstration of better (fixed at 6 rows):\n")
	-- these variables can be written in any order
	row1 = string.rep(" ", 5) .. "*"
	row2 = string.rep(" ", 4) .. "***"
	row3 = string.rep(" ", 3) .. "*****"
	row4 = string.rep(" ", 2) .. "*******"
	row5 = string.rep(" ", 1) .. "*********"
	row6 = "***********"
	-- the shape of the pyramid is affected by the order the rows are printed
	print(row1)
	print(row2)
	print(row3)
	print(row4)
	print(row5)
	print(row6)
end

function best(numberOfRows)
	print("\nDemonstration of best ("..numberOfRows.." rows):\n")
	-- don't change this function
	-- for variable = start, finish, step do
	for row = 1, numberOfRows, 1 do
		-- string.rep() repeats the character(s) given by the number supplied
		-- eg string.rep("*", 4) returns "****"
		-- a pyramid of 10 rows:
		-- row 1 = 9 spaces, 1 star
		-- row 2 = 8 spaces, 3 stars
		-- row 3 = 7 spaces, 5 stars
		-- draw each line by concatenating the spaces part with the stars part
		-- eg for the first line:
		-- lineOfChars = string.rep(" ", 10 - 1) .. string.rep("*", (1 - 1) * 2 + 1) -> 
		-- lineOfChars = string.rep(" ", 9) .. string.rep("*", (0 * 2 + 1) -> 1 : 9 spaces 1 star
		lineOfChars = string.rep(" ", numberOfRows - row) .. string.rep("*", (row - 1) * 2 + 1)
		print(lineOfChars)
	end
end

function reversed(numberOfRows)
	print("\nDemonstration of reversed ("..numberOfRows.." rows):\n")
	-- change the for loop to reverse the triangle
	for row = 1, numberOfRows, 1 do
		lineOfChars = string.rep(" ", numberOfRows - row) .. string.rep("*", (row - 1) * 2 + 1)
		print(lineOfChars)
	end
end

function main()
	print("\n"..ORANGE.."This program draws trees of various heights depending on the number of rows")
	numRows = getNumber("Number of rows (5 to 20)?")

	if numRows > 20 then numRows = 20 end
	-- draw a demo triangle
	lazy()
	pause()
	better()
	pause()
	best(numRows)
	pause()
	reversed(numRows)
	print()
	print(ORANGE..[[This is your assignment:
1. Change the code on line 106 to draw the pyramid upside down.
2. Move the print statements in lazy() and/or better() to draw them upside down as well
3. Draw the trees in GREEN
4. Add (ORANGE) tree trunks to the drawings as well.]])
end

main() -- program starts here