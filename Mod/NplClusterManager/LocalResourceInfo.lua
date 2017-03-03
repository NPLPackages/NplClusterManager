--[[
Title: LocalResourceInfo
Author(s):  lizhiqiang
Date: 2017.2.22
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");
local LocalResourceInfo = commonlib.gettable("Mod.NplClusterManager.LocalResourceInfo");

local CPU;
local Memory;
local Disk;
local Net;

NPL.load("(gl)script/ide/System/os/os.lua");
local os = commonlib.gettable("System.os");

function LocalResourceInfo:getLocalResourceInfo()
	local myOs = os.GetPlatform();
	_guihelper.MessageBox(myOs);
	echo(myOs);
end

function LocalResourceInfo:Test()

	LOG.std(nil, "info", "cpu", "get cpu info");
	os.run("@ wmic cpu list", 
	function(err, result) 
		if(result) then 
			echo(result);
		else
			echo(err);
		end
	
	end);
	
end

local function activate()
	LocalResourceInfo.Test();
end
NPL.this(activate);