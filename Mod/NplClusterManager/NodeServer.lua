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

local function InitServer()
	--NPL.AddPublicFile(server_file, 10001);
	--NPL.StartNetServer("127.0.0.1", "8099");
	local node = NPL.CreateRuntimeState("node1", 0);
	node:Start();

	LOG.std(nil, "info", "Server", "Server starts");
end

local function activate()
	--_guihelper.MessageBox();

	echo({"11111111111  server", })
	if(not isServerInitialized) then 
		isServerInitialized = true;
		InitServer();
		
	end 
	if(msg and msg.type) then
		LOG.std(nil, "info", "msg received");
		--_guihelper.MessageBox(msg)

		echo(msg);
	end
end
NPL.this(activate)