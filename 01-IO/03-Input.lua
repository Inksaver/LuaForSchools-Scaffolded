-- Demonstration and reference file. All code working
-- Python has an input() function to read user typed text
-- Lua uses io.read()
print()						-- empty line for clarity
io.write("Click here in the Output window, type your name then press Enter: ")
response = io.read()		-- response is a variable used to store whatever the user types in
print("Hello "..response)	-- print out "Hello " joined (concatenated) to the user input

print("\nDemonstration code completed. Move to file '04-Input function.lua'\n")