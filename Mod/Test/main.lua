--[[
Title: Testing every aspect of Mod interface
Author(s):  lizhiqiang
Date: 2017.02.10
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/Test/main.lua");
local Test = commonlib.gettable("Mod.Test");
------------------------------------------------------------
]]

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

-- called when a new world is loaded. 
function Test:OnWorldLoad()
	LOG.std(nil, "info", "Test", "Mod test on world loaded");
	--_guihelper.MessageBox("hello from helper class");
	NPL.activate("Mod/Test/NodeServer.lua", {data = "lzq", password = "123"});
	--NPL.activate(format("Mod/Test/NodeServer.lua", msg.tid or msg.nid), {"replied"});
end

-- called when a world is unloaded. 
function Test:OnLeaveWorld()
	LOG.std(nil, "info", "Test", "Mod test on leave world");
	
end