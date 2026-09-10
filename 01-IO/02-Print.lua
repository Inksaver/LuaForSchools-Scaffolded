-- There are syntax errors in some of the code lines
-- Run the program and check what error is produced
-- correct each line in turn and run again
print("Hello World line 4")		-- This line works!
Print("Hello World line 5")		-- Print.lua:5: attempt to call global 'Print' (a nil value) Hint:ALL Lua commands are lower case
print(Hello World line 6)		-- Print.lua:6: ')' expected near 'World' Hint:nothing to do with brackets. Compare with line 4
print("Hello".."World line 7")	-- This line works! The string "Hello" is joined (concatenated) to "World line 7" with 2 dots ..
print(4+5 / 3)					-- This line works!	The calculation is performed and printed out
print("2 + 2 =", 2 + 2)			-- This line works! The comma after the string "2 + 2 =" allows mixing of strings and numbers
age = 5							-- no output from this line. It creates a variable called 'age' and stores the value 5 in it
print(age)						-- This line works. Output is 5
print("age = " + age)			-- Print.lua:12: attempt to perform arithmetic on a string value. This works in Python, NOT in lua. Hint: line 7

print([[This looks like a multi-line comment
but it does not start with --
It is an easy way to print a multi-line block of text.
Just use double square brackets at the start and end]])
	
--[[
	using io.write() instead of print().
	This leaves the cursor on the same line
	instead of moving it down to the next line
  ]]
  
io.write("Hello World line 25")		-- Works BUT output is similar to: Hello World line 25Hello World line 26
io.write("Hello World line 26\n")	-- Output as above with final line "Program completed in #.## seconds (pid: ######)".
-- the newline chracter \n NOTE: \Backslash! NOT /forward slash. Drops the cursor to the next line
print([[Final step for this program:
Use what you have learned to make the final 3 lines
34, 35 and 36 to output like this:
Line 34
Line 35
Line 36]])
io.Write("Line 34")		-- Print.lua:32: attempt to call field 'Write' (a nil value)
io.write(Line 35)		-- Print.lua:35: ')' expected near '35'
io.write("Line 36)		-- Print.lua:36: unfinished string near '<eof>' Hint: ? missing "
	
print("\nCode completed. Move to file '03-Input.lua'\n")