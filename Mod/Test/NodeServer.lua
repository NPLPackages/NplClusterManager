--[[
Title: Testing every aspect of Mod interface
Author(s):  lizhiqiang
Date: 2017.02.10
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/Test/main.lua");
local Test = commonlib.gettable("Mod.Test");

if(msg) then 
	_guihelper.MessageBox(msg);
end
------------------------------------------------------------
]]
local function activate()
	
	--[[
	if(msg.tid) then
      -- unauthenticated? reject as early as possible or accept it. 
      if(msg.password=="123") then
         NPL.accept(msg.tid, msg.username or "default_user");
      else
         NPL.reject(msg.tid);
      end
	elseif(msg.nid) then
      -- only respond to authenticated messages. 
      --NPL.activate(format("%s:some_reply_file.lua", msg.nid), {"replied"});
	  _guihelper.MessageBox("hello from helper class");
   end
   ]]

   if(msg.tid) then 
		_guihelper.MessageBox(1);
	else
		_guihelper.MessageBox(2);
	end

end
NPL.this(activate);