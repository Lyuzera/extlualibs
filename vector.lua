--[[
	Copyright (c) 2020 Moisés dos Santos

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]

local vector = {
	_VERSION = 'vector.lua v2020.15.07',
	_URL = 'https://github.com/Lyuzera/extlualibs/vector.lua'
}

setmetatable(vector, {
	__call = function(self, ...)
		local obj = {...}
		return setmetatable(obj, {__index = self})
	end
})

-- access specified element with bounds checking
function vector:at(index)
	return self[index]
end
vector.get = vector.at

-- access the first element
function vector:front()
	return self[1]
end

-- access the last element (public member function)
function vector:back()
	return self[#self]
end

-- checks whether the container is empty
function vector:empty()
	return #self == 0
end

-- returns the number of elements
function vector:size()
	return #self
end

-- clears the contents
function vector:clear()
	for i = 1, #self do
		self[i] = nil
	end
end
vector.reset = vector.clear

-- adds an element to the end
function vector:emplace_back(element)
	self[#self + 1] = element
end

-- adds an element to the begin
function vector:emplace_front(element)
	table.insert(self, 1, element)
end

-- erases elements
function vector:erase(element)
	for i = 1, #self do
		if self[i] == element then
			table.remove(self, i)
			break
		end
	end
end

-- removes the last element
function vector:pop_back()
	self[#self] = nil
end

-- removes the first element
function vector:pop_front()
	self:erase(self[1])
end

return vector
