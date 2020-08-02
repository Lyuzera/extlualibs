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

local class = {
	_VERSION = 'class.lua v2020.02.08',
	_URL = 'https://github.com/Lyuzera/extlualibs/blob/master/class.lua'
}

local function copyTable(table)
	local result = {}

	local mt = getmetatable(table)
	if mt then
		setmetatable(result, mt)
	end

	for k, v in pairs(table) do
		if type(v) == 'table' and k ~= '__index' and k ~= '__newindex' then
			result[k] = copyTable(v)
		else
			result[k] = v
		end
	end
	return result
end

setmetatable(class, {
	__call = function(self, classScope)
		return setmetatable({}, {
			__index = classScope,
			__call = function(self)
				local obj = {}
				setmetatable(obj, {__index = self})

				if obj.init and type(obj.init) == 'function' then
					obj:init()
				end

				for key, value in pairs(classScope) do
					if type(value) == 'table' then
						obj[key] = copyTable(value)
					end
				end
				return obj
			end
		})
	end
})

return class
