--[[
Author(s):  lizhiqiang
Date: 2017.1.28
Desc: This is also a test of NPL cluster manager. 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/Test/main.lua");
local Test = commonlib.gettable("Mod.Test");
------------------------------------------------------------
]]
NPL.load("(gl)Mod/Test/main.lua");
--local Test = commonlib.gettable("Mod.Test");
local Test = commonlib.inherit(commonlib.gettable("Mod.ModBase"),commonlib.gettable("Mod.Test"));

function Test:ctor()
end

-- virtual function get mod name

function Test:GetName()
	return "Test"
end

-- virtual function get mod description 
function Test:GetDesc()
	return "Test is a plugin in paracraft"
end

function Test:init()
	
	LOG.std(nil, "info", "Test", "plugin initialized");
	
end

function Test:OnLogin()
end

function Test:OnWorldLoad()
	_guihelper.MessageBox("asd");
end

function Test:OnLeaveWorld()
	
end

function Test:OnDestroy()

end