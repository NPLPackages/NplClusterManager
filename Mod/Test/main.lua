--[[
Title: Testing every aspect of Mod interface
Author(s):  LiXizhi
Date: 2015.10
Desc: This is also a greate demo of mod interface. 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/Test/main.lua");
local Test = commonlib.gettable("Mod.Test");
------------------------------------------------------------
]]
NPL.load("(gl)Mod/Test/main.lua");
local Test = commonlib.gettable("Mod.Test");

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
	_guihelper.MessageBox("Directory is not a valid minecraft world directory, please select a valid folder.");
end

function Test:OnLeaveWorld()
	
end

function Test:OnDestroy()

end