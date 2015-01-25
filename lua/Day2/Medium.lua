dofile("util.lua")
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

local arraymt = {
	__add = concatenate
}
local _priv={}
local global_mt = {
	__newindex = function(t, k, v) 
		setmetatable(v, arraymt)
		_priv[k]=v
	end,
	__index = function(t, k)
		return _priv[k]
	end
}
setmetatable(_G, global_mt)

b1 = { 1, 2, 3}
b2 = { 4, 5, 6} 

print(table_to_string(b1 + b2))

local Queue = {}
Queue.__index = Queue

function Queue.new()
	local self = setmetatable({}, Queue)
	local arr  = {}
	self.ind = 1
	self.lower = 1
	self.arr = arr
	return self
end

function Queue:add(val)
	self.arr[self.ind] = val
	print('added ' .. val .. ' to ' .. self.ind)
	self.ind = self.ind + 1
end

function Queue:remove(val)
	local ret = self.arr[self.lower]
	self.arr[self.lower] = nil
	self.lower = self.lower + 1
	return ret
end

print ("QUEUE!")
local q = Queue:new()
q:add('A')
q:add('B')
print(q:remove())
print(q:remove())
print(q:remove())

