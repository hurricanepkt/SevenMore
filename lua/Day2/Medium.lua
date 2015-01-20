function concatenate(a1, a2) 
	local result = {}
	local iter = 1;
	for k, v in pairs(a1) do
		result[iter] = v
		iter = iter + 1
	end
	for k, v in pairs(a2) do
		result[iter] = v
		iter = iter + 1
	end
	return result
end

