function for_loop(a, b, f)
	while (a < b) do
		f()
		a = a + 1
	end
end

function mkg() 
	print('hello mark') 
end 

for_loop(0,10,mkg) 