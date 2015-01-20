function reduce(max, init , f )
	local tot = init
	for i=1, max, 1 do
		tot =  f(tot, i)
	end
	
	print('reduce(' .. max .. ',' .. init .. ',func) = ' .. tot )
	return tot
end 

function add(previous, next)
	return previous + next
end 

reduce(5,0, add)


function multiply(previous, next)
	return previous * next
end 

reduce(5, 1, multiply)
function factorial(n) 
   local tot =    reduce(n,1, multiply)
   print('factorial(' .. n .. ') = ' .. tot )
   return tot
end 

for i = 1, 10, 1 do
	factorial(i)
end 