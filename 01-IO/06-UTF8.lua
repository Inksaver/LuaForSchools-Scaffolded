-- This file has one line that needs fixing
--[[
https://www.w3schools.com/charsets/ref_utf_box.asp
utf8 box characters stored here for easy copy/paste:

┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
]]

function input(prompt)
	io.write(prompt)	
	return io.read()
end

-- set some string variables
top = "╔═══════════════════════════════════════╗"
blank = "║                                       ║"
bottom = "╚══════════════════════print("\nCode completed. Move to file '06-UTF8.lua'\n")═════════════════╝"

print(top)
print(blank)
print("║      Welcome to Lua programming!      ║")
print(blank)
print(bottom)

name = input("Type your name and press Enter_")
print(top)
print("║  ".. name + "  ║")			-- 31: attempt to perform arithmetic on global 'name' (a string value) Hint: string concatenation ?
print(bottom)
print("\nNow change it so your name is neatly in the middle of the box")
print("Extra bonus, insert blank lines above and below your name!")