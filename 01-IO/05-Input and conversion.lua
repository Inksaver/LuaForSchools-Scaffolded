-- One line needs fixing. The input() function is working

function input(prompt)
	io.write(prompt)	-- prompt is the text passed in from lines 9 and 12
	return io.read()	-- the output from io.read() is passed back to the variables used in lines 9 and 11
end

testNumber = "12"								-- testNumber holds the string value of "12"
testNumber = tonumber(testNumber)				-- testNumber has been converted to a number with the tonumber() Lua function
print("testNumber + 15 = " .. testNumber + 15)	-- Works!

age = input("How old are you? ")				-- NOTE age is NOT a number, it is a string representing the number user entered
--age = tonumber(age)							-- tonumber(some random text) tries to convert text to a number. Nil if it fails
--[[
comparisons
>  greater than
<  less than
>= greater than or equal
<= less than or equal
== is equal
~= is not equal
]]

-- check if age now contains a number. tonumber() returns either a number or nil if it cannot convert the text
if age == nil then						-- un-succesful conversion: age is nil
	print("You did not type in a number")
else									-- conversion success
	-- see if the number typed in is greater than or equal to 18
	if age >= 18 then					-- 29: attempt to compare number with string Hint: maybe uncomment a useful line above?
		print("You are over 18")
	else
		print("You are under 18")
	end
end

print("\nCode completed. Move to file '06-UTF8.lua'\n")