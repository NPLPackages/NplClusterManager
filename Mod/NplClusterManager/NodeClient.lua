--[[
Title: NodeClient
Author(s):  lizhiqiang
Date: 2017.2.16
Desc: 
]]

NPL.load("(gl)script/ide/commonlib.lua");

local NodeServer = commonlib.gettable("Mod.NplClusterManager.NodeClient");
local server_file = "Mod/NplClusterManager/NodeServer.lua";
local client_file = "Mod/NplClusterManager/NodeClient.lua";

local isClientInitialized;

local function InitClient()
	NPL.AddPublicFile(client_file, 1);
	NPL.AddNPLRuntimeAddress({host = "127.0.0.1", port = "8090", nid = "testServer"});
	LOG.std(nil, "info", "Client", "Client starts");

	
	while( NPL.activate(string.format("(%s)testServer:Mod/NplClusterManager/NodeServer.lua", "node1"), 
            {type = "res", data="from client"}) ~=0 ) do
            -- if can not send message, try again.
            echo("failed to send message");
            ParaEngine.Sleep(1);
	end
end

local function activate()
	
	if(not isClientInitialized) then 
		InitClient();
	end
end
NPL.this(activate)