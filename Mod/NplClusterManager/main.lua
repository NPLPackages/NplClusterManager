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

local NplClusterManager = commonlib.inherit(commonlib.gettable("Mod.ModBase"),commonlib.gettable("Mod.NplClusterManager"));

function NplClusterManager:ctor()
end

-- virtual function get mod name

function NplClusterManager:GetName()
	return "NplClusterManager"
end

-- virtual function get mod description 
function NplClusterManager:GetDesc()
	return "Test is a plugin in paracraft"
end

function NplClusterManager:init()
	LOG.std(nil, "info", "NplClusterManager", "plugin initialized");
	
end

function NplClusterManager:OnLogin()
end

-- called when a new world is loaded. 
function NplClusterManager:OnWorldLoad()
	LOG.std(nil, "info", "NplClusterManager", "Mod test on world loaded");
	_guihelper.MessageBox("asd");
	--NPL.activate("");
end

-- called when a world is unloaded. 
function NplClusterManager:OnLeaveWorld()
	LOG.std(nil, "info", "NplClusterManager", "Mod test on leave world");
	
end

function NplClusterManager:OnDestroy()
end
