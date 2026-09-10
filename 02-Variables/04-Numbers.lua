--[[
Lua does not have different datatypes for integer(whole numbers) and float(floating point numbers)
Floats can be converted to integers with:
math.floor(1.6) = 1
math.ceil(1.6) = 2
Integer division uses //:
There are no errors in this code
]]
function main()
	print()
	print("8.2 / 2.3 = ".. 8.2 / 2.3)
	print("8.2 // 2.3 = "..8.2 // 2.3)
	print("math.floor(8.2 / 2.3) = "..math.floor(8.2 / 2.3))
	print("math.floor(8.2 // 2.3) = "..math.floor(8.2 // 2.3))
	print("math.ceil(8.2 / 2.3) = "..math.ceil(8.2 / 2.3))
	
	print("modulus (remainder) of 7 / 3 is ".. 7 % 3)
	print("modulus (remainder) of 8.2 / 2.3 is ".. 8.2 % 2.3)
	
	print("\nSection 02-Variables completed. Move to folder '03-Loops'\n")
end

main()