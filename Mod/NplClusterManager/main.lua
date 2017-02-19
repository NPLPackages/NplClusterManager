--[[
Title: NplClusterManager
Author(s):  lizhiqiang
Date: 2017.2.10
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/NplClusterManager/main.lua");
local Test = commonlib.gettable("Mod.NplClusterManager");
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
	LOG.std(nil, "info", "NplClusterManager", "Mod NplClusterManager on world loaded");
	_guihelper.MessageBox("asdasd");
	--NPL.activate("Mod/NplClusterManager/NodeClient.lua");
end

-- called when a world is unloaded. 
function NplClusterManager:OnLeaveWorld()
	LOG.std(nil, "info", "NplClusterManager", "Mod NplClusterManager on leave world");
	
end

function NplClusterManager:OnDestroy()
end
