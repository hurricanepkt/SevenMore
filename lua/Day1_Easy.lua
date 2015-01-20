function ends_in_3(num) 
	return num % 10 == 3
end 

function isPrime(num)
    if num <= 3 then
		return num > 1
	end 
	if num % 2 == 0 or num % 3 == 0 then
		return false
	end 
	local j = 5 
	while j * j <= num  do
		if  num % j == 0 or  num % (j + 2) == 0 then
			return false
		end
		j  = j + 6
	end 
	return true
end

function printPrimesThatEndIn3(n) 
	local j = 3;
	local hits = 0;
	while (hits < n) do
		if (ends_in_3(j) and isPrime(j)) then
			hits = hits + 1
			print(j)
		end 
		j = j + 10
	end 
end 

--for   i =0, 100 , 1 do
--  print(i ..  ' ends in 3 : '  .. tostring(ends_in_3(i)) .. ' prime : '  .. tostring(isPrime(i)))
--end 

printPrimesThatEndIn3(20) 