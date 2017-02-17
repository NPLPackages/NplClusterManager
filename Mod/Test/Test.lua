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

local function activate()
	NPL.activate("Mod/Test/NodeServer.lua", {data = "lzq,"});
end
NPL.this(activate);