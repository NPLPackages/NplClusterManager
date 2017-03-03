--[[
Title: NodeServer
Author(s):  lizhiqiang
Date: 2017.2.16
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");

local NodeServer = commonlib.gettable("Mod.NplClusterManager.NodeServer");
local server_file = "Mod/NplClusterManager/NodeServer.lua";
local client_file = "Mod/NplClusterManager/NodeClient.lua";

local isServerInitialized;
local RequestMethod_Get = "GET";
local RequestMethod_Post = "POST";
local RequestType_Res = "res";
local RequestType_Cmd = "cmd";

local function InitServer()

	NPL.AddPublicFile(server_file, 1);
	NPL.load("(gl)script/apps/WebServer/WebServer.lua");
	WebServer:Start("script/apps/WebServer/admin", "0.0.0.0", 8090);
	ParaGlobal.ShellExecute("open", "http://localhost:8090/console", "", "", 1);
	
	LOG.std(nil, "info", "Server", "Server starts");
end

local function activate()

	if(not isServerInitialized) then 
		isServerInitialized = true;
		InitServer();
	end

	if(msg and msg.type) then
			LOG.std(nil, "info", "msg received");
			echo(msg);

			if(msg.method == RequestMethod_Get) then
				if(msg.type == "res") then
					echo("111res");
				end
			elseif(msg.method == RequestMethod_Post) then 

			end
	end
end
NPL.this(activate)