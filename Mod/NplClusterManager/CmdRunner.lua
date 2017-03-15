--[[
Title: CmdRunner
Author(s):  lizhiqiang
Date: 2017.2.22
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");

NPL.load("(gl)Mod/NplClusterManager/CmdRunner.lua");
local CmdRunner = commonlib.gettable("Mod.NplClusterManager.CmdRunner");

NPL.load("(gl)script/ide/System/os/os.lua");
local os = commonlib.gettable("System.os");
NPL.load("(gl)script/ide/Encoding.lua");
local Encoding = commonlib.gettable("commonlib.Encoding");

local cmd = "";

function CmdRunner:run(script)
	LOG.std(nil, "info", "cmd", "run cmd"); 
	
	--local err, result = os.run(script);

	--echo(result);

	--return result;
		--err = commonlib.Encoding.DefaultToUtf8(err);
		--re = commonlib.Encoding.DefaultToUtf8(re);
	
	cmd = script;	
	echo(cmd);
	return cmd;
	
end

local function activate()
	if(msg and msg.type == "cmd") then
		local re = nil;
		if(msg.content ~= "") then
			local err, result = os.run(msg.content);
			re = err;
		else
			re = "no valid cmd";
		end
		echo(re);
	end
end
NPL.this(activate);