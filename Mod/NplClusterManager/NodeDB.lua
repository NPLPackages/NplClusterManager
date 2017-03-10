--[[
Title: NodeDB
Author(s):  lizhiqiang
Date: 2017.3.9
Desc: 
]]

NPL.load("(gl)Mod/NplClusterManager/NodeDB.lua");
local NodeDB = commonlib.inherit(commonlib.gettable("Mod.ModBase"),commonlib.gettable("Mod.NodeDB"));

NPL.load("(gl)script/ide/System/Database/TableDatabase.lua");
local TableDatabase = commonlib.gettable("System.Database.TableDatabase");
local db = TableDatabase:new():connect("temp/mydatabase/", function() end);