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

local map = {
	_VERSION = 'map.lua v2020.17.07',
	_URL = 'https://github.com/Lyuzera/extlualibs/blob/master/map.lua'
}

setmetatable(map, {
	__call = function(self)
		local obj = {}
		return setmetatable(obj, {__index = self})
	end
})

-- access specified element with bounds checking (public member function)
function map:at(key)
	return self[key]
end
map.get = map.at

-- checks whether the container is empty (public member function)
function map:empty()
	return self:size() == 0
end

-- returns the number of elements (public member function)
function map:size()
	local count = 0
	for key in pairs(self) do
		count = count + 1
	end
	return count
end

-- clears the contents (public member function)
function map:clear()
	for key in pairs(self) do
		self[key] = nil
	end
end
map.reset = map.clear

-- erases elements (public member function)
function map:erase(key)
	self[key] = nil
end

-- finds element with specific key (public member function)
function map:find(key)
	return self[key]
end

return map
