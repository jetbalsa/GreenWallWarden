function GreenWallWarden()
   for i=1,GetNumDisplayChannels() do
      if select(1,GetChannelDisplayInfo(i)) == "mcs" then
         chanid = i;
      end
   end
   local chanindex = GetSelectedDisplayChannel();
   SetSelectedDisplayChannel(chanid);
   garry = {}; 
   local gcount = GetNumGuildMembers(); 
   for i=1,gcount,1 do 
      local online=select(9,GetGuildRosterInfo(i)); 
      if online then garry[Ambiguate(select(1,GetGuildRosterInfo(i)), "none")] = true; 
      end 
   end 
   greenarry = {};
   local count = select(5, GetChannelDisplayInfo(chanid)); 
   for i=1,count do 
      local active = select(1, GetChannelRosterInfo(chanid, i)); 
      greenarry[active] = true;
   end
   local userlist = "Users Found without Greenwall: ";
   for k,v in pairs(garry) do
      if not greenarry[k] then
         userlist = userlist .. ", " .. k;
		 ChatThrottleLib:SendChatMessage("BULK", "gw", "I noticed you do not have Greewall Installed, We use Greenwall to make sure everyone can see oneanother in guild chat since we have a sister guild. Greenwall has zero setup and is automated. As this message is as well. Sorry for the spam, have a nice day.", "WHISPER", nil, k);
      end
   end
   print (userlist);
   SetSelectedDisplayChannel(chanindex);
   return true;
end


function RunGreenWarden()
ListChannelByName("mcs")
GuildRoster()
ListChannels()
print("[GreenWallWarden] Just pulled glist and greenwall list, waiting 15s - I hope you don't have WIM On :3 - Thank Starwinds-Stormrage when you see him!");

   for i=1,GetNumDisplayChannels() do
      if select(1,GetChannelDisplayInfo(i)) == "mcs" then
         chanid = i;
      end
   end
   greenchanindex = GetSelectedDisplayChannel();
   SetSelectedDisplayChannel(chanid);
   SetSelectedDisplayChannel(greenchanindex);
   C_Timer.After(15, GreenWallWarden);
end