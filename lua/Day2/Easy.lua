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

b1 = { 1, 2, 3}
b2 = { 4, 5, 6} 

b = concatenate(b1, b2)

for k, v in pairs(b) do
		print( v)
end 

local _private = {}

function my_strict_read(table, key)
   if _private[key] then
      return _private[key]
   else
      error("Invalid key: " .. key)
   end
end

function my_strict_write(table, key, value)
   if _private[key] and value then
      error("Duplicate key: " .. key)
   else
      _private[key] = value
   end
end

local mt = {
   __index    = my_strict_read,
   __newindex = my_strict_write
}



treasure = {}
setmetatable(treasure, mt)

treasure.gold = 50
print(treasure.gold)
treasure.gold = nil
print('deleted')