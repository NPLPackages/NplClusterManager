--[[
Title: LocalResourceInfo
Author(s):  lizhiqiang
Date: 2017.3.11
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");
local Process = commonlib.gettable("Mod.NplClusterManager.Process");

NPL.load("(gl)script/ide/System/os/os.lua");
local os = commonlib.gettable("System.os");

function Process:newProcess()
	LOG.std(nil, "info", "cpu", "get system info"); 

	local t = "./Mod/NplClusterManager/newProcess.bat";
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

	if(err) then 
		return "failed";
	else 
		return "success";
	end

end

function Process:onWorldLoad()
	
end

local function activate()
	Process.newProcess();
end
NPL.this(activate);
