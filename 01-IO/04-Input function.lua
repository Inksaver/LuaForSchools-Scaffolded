-- Demonstration and reference file. All code working
-- input function similar to Python
-- This function is ignored until it is specifically 'called' in lines 9 and 12
function input(prompt)
	io.write(prompt)	-- prompt is the text passed in from lines 9 and 12
	return io.read()	-- the output from io.read() is passed back to the variables used in lines 10 and 12
end

-- code runs from this line. The function above is ignored
print()					-- empty line for clarity
-- call the new input() function
response = input("Click here in the Output window, type your name then press Enter: ")
print("Hello "..response)				-- print out "Hello " joined (concatenated) to text typed by the user
print()									-- empty line for clarity
-- call it again
age = input("How old are you? ")		-- NOTE age is NOT a number, it is a string representing a number eg "11"
print("You are "..age.." years old")	-- it would need converting to a number before any calculations 

print("\nDemonstration code completed. Move to file '05-Input and conversion.lua'")
print()