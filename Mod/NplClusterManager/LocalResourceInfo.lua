--[[
Title: LocalResourceInfo
Author(s):  lizhiqiang
Date: 2017.2.22
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");
local LocalResourceInfo = commonlib.gettable("Mod.NplClusterManager.LocalResourceInfo");

NPL.load("(gl)script/ide/Encoding.lua");
local Encoding = commonlib.gettable("commonlib.Encoding");

local CPU;
local Memory;
local Disk;
local Net;

NPL.load("(gl)script/ide/System/os/os.lua");
local os = commonlib.gettable("System.os");

function LocalResourceInfo:getLocalResourceInfo()
	LOG.std(nil, "info", "cpu", "get system info"); 
	
	local err, result = os.run("systeminfo");
	echo(err);
	echo(result);
	err = commonlib.Encoding.DefaultToUtf8(err);
	return err;
end

function LocalResourceInfo:Test()

	LOG.std(nil, "info", "cpu", "get system info"); 

	local t = "./Mod/NplClusterManager/test1.bat";
	local file = ParaIO.open(t, "r");
	local stdout_text = nil;
	if(file:IsValid()) then
		stdout_text = file:GetText();
		file:close();
	end
	echo(stdout_text);
	
	os.run(stdout_text, function(err, result) 
		
		echo(err);
		echo(result);
	end);
	
end

local function activate()
	LocalResourceInfo.Test();
end
NPL.this(activate);