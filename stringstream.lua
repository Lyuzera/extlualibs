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

local stringstream = {
	_VERSION = 'stringstream.lua v2020.15.07',
	_URL = 'https://github.com/Lyuzera/extlualibs/blob/master/stringstream.lua'
}

setmetatable(stringstream, {
	__call = function(self)
		local obj = {}
		return setmetatable(obj, {__index = self})
	end
})

-- Insert formatted string (public member function)
function stringstream:append(str, ...)
	self[#self + 1] = str:format(...)
end

-- Get content (public member function)
function stringstream:str()
	return table.concat(self)
end

-- clears the contents (public member function)
function stringstream:clear()
	for index in ipairs(self) do
		self[index] = nil
	end
end
stringstream.reset = stringstream.clear

-- print the content (public member function)
function stringstream:printf(clear)
	print(self:str())
	
	clear = clear or true
	if clear then
		self:clear()
	end
end

return stringstream
