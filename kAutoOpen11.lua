local kAutoOpen11 = CreateFrame('Frame')

kAutoOpen11:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

local atBank, atMail, atMerchant, isLooting

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	KEY
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

	--	Some items I didn't find, I copied them from the below alternative/companion addons, Thanks to the authors.
	--	SS:			Open Sesame 				--	Alternative Addon, going work on all versions of WoW, both classics and retail. 
	--	BG:			Openable Be Gone			--	Alternative Addon, has in game GUI for selecting items you want to open or not.
	--	OW:			Openables					--	Weakaura, Doesn't work for me, was a decent idea when the New Openables addon was dead.
	--	OC:			New Openables Continued		--	Companion Addon, Opens items Openables cannot or fails to, like clams, toys, pets, etc.
												--	Highly Recommend using this with any AutoOpening addon.
	--	00:			Year last seen (event section mostly)
	--	NO:			Just wont open or kills the addon :P
	--	LP:			Needs Lock Picking to Open
	--	PF:			Needs a Profession to Open
	--	FF:			Can be changed to True, it contains the Find Fish book, If I don't need it, I mail it for alts
	
	--	NOTE:		Ignore "OneDrive Sync:", just added it, so whenever I add something, I can run it and update OneDrive right away... If I remember :P
	--	OneDrive:	https://1drv.ms/f/s!AiSfe94wb0vWjQarA4JNTkq0uMfl

	--	Added these here to open other parts when I need to edit them			
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenMX.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenEV.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen12.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen11.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen10.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen09.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen08.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen07.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen06.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen05.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen04.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen03.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen02.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen01.lua
	--	WoW is in the default directory, Created a secondary path "C:\WoW\" with junction https://learn.microsoft.com/en-us/sysinternals/downloads/junction)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	11	WORLD OF WARCRAFT:	THE WAR WITHIN	-	WORLD SOUL SAGA I
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems11 = {
								--														Looted YYMMDD
			[248127] = true,	--	Delver's Cosmetic Surprise Bag						Looted 250813				
			[248126] = true,	--	Delver's Starter Kit								Looted 250813				
			[247821] = true,	--	Cache of K'areshi Treasures							Looted 250929				
			[247820] = true,	--	Cache of K'areshi Treasures (Heroic)				Looted 251209				
			[245611] = true,	--	Wriggling Pinnacle Cache							Looted 250922
			[245589] = true,	--	Hellcaller Chest									Looted 250701				Loot Issues, Currency Lockout? Was Fixed
			[244865] = true,	--	Pinnacle Cache										Looted 250813
			[244842] = true,	--	Fabled Veteran's Cache								Looted 250810
			[247821] = true,	--	Cache of K'areshi Treasures							Looted 250813
			[244696] = true,	--	Overcharged Chest									Looted 250619
			[244466] = true,	--	Dagran's Pouch of Shards							Looted 250619
			[243235] = true,	--	Adventurer's Footlocker								Looted 251203
			[242386] = true,	--	Lorewalker's Crate of Memorabilia					Looted 250806
			[239546] = true,	--	Confiscated Cultist's Bag							--
			[239489] = true,	--	Radiant Officer's Cache								--
			[239440] = true,	--	Dastardly Prize Purse								Looted 250601
			[239128] = true,	--	Theatre Troupe's Trove								Looted 250726
			[239122] = true,	--	The General's War Chest								--
			[239118] = true,	--	Pinnacle Cache										Looted 250619
			[239004] = true,	--	Radiant Service Satchel								--
			[238208] = true,	--	Nanny's Surge Dividends								--
			[237760] = true,	--	Arathi Champion's Spoils							--
			[237759] = true,	--	Arathi Cleric's Chest								--
			[237743] = true,	--	Arathi Soldier's Coffer								--
			[236953] = true,	--	Crimson Valorstone									--
			[236944] = true,	--	Weathered Mysterious Satchel						--
			[236758] = true,	--	Extravagant Tip Chest								--
			[236757] = true,	--	Generous Tip Chest									--
			[235911] = true,	--	Weathered Mysterious Satchel						--
			[235151] = true,	--	Distinguished Actor's Chest							Looted 250726
			[235054] = true,	--	Pristine Mysterious Cache							--
			[235054] = true,	--	Pristine Mysterious Cache							--
			[235052] = true,	--	Weathered Mysterious Cache							--
			[234731] = true,	--	Cache of Undermine Treasures						--
			[234729] = true,	--	Cache of Undermine Treasures						--
			[233276] = true,	--	Delver's Starter Kit								--
			[232877] = true,	--	Timely Goodie Bag									--
			[232372] = true,	--	Crate of Bygone Riches								--
			[229354] = true,	--	Algari Adventurer's Cache							--
			[229129] = true,	--	Cache of Delver's Spoils							Looted	250622
			[228933] = true,	--	Algari Leatherworker's Satchel						Looted	250520
			[228932] = true,	--	Algari Engineer's Satchel							Looted 	250520
			[228917] = true,	--	Satchel of Ore										Looted	250520
			[228916] = true,	--	Algari Tailor's Satchel								Looted	250520
			[228741] = true,	--	Lamplighter Supply Satchel							--
		--	[228361] = true,	--	Seasoned Adventurer's Cache							Added to MX, Level 80 Item Recieved on Lower Levels
			[228220] = true,	--	Waxy Bundle											--
			[227792] = true,	--	Everyday Cache										--
			[227450] = true,	--	Sky Racer's Purse									--
			[226814] = true,	--	Chest of Gold										--
			[226273] = true,	--	Awakened Mechanical Cache							--
			[226264] = true,	--	Radiant Cache										--
		--	[226258] = false,	--	Delver's Pouch of Reagents							Does Not Open
			[226256] = true,	--	Token of the Remembrancers							--
			[226194] = true,	--	Cache of Nerubian Treasures	Heroic					--
			[226193] = true,	--	Cache of Nerubian Treasures							--
			[226149] = true,	--	Pile of Humming Shinies								--
			[226148] = true,	--	Wax-sealed Weathered Crests							--
			[226147] = true,	--	Bunch of Brave Rocks								--
			[226146] = true,	--	Handful of Humming Shinies							--
			[225571] = true,	--	The Weaver's Gratuity								--
		--	[225249] = false,	--	Rattling Bag o'Gold									Item, Not Bag Stupidly
			[224784] = true,	--	Pinnacle Cache										--
			[224556] = true,	--	Glorious Contender's Strongbox						--
			[223953] = true,	--	Timerunner's Parting Pack							--
		--	[221375] = false,	--	Pack of Runed Harbinger Crests						Item, Not Bag Stupidly (OC)
		--	[221373] = false,	--	Satchel of Carved Harbinger Crests					Item, Not Bag Stupidly (OC)
			[221269] = true,	--	Crimson Valorstone									--
		--	[221268] = false,	--	Pouch of Weathered Harbinger Crests					Item, Not Bag Stupidly (OC)
		--	[220776] = false,	--	Glorious Cluster of Gilded Harbinger Crests			Item, Not Bag Stupidly (OC)
		--	[220773] = false,	--	Celebratory Pack of Runed Harbinger Crests			Item, Not Bag Stupidly (OC)
		--	[220767] = false,	--	Triumphant Satchel of Carved Harbinger Crests		Item, Not Bag Stupidly (OC)
			[217011] = true,	--	Amateur Actor's Chest								Looted	200726

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen11:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen11:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen11:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen11:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen11:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen11:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen11:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen11:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen11:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen11:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	
	for bag = 0, 4 do
		for slot = 0, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems11[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F11 " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
		end
	end
end)


						--	|cFFFFD700	Gold2		!AutoOpen
						--  |cFF9D9D9D	Grey		ing  on
						--  |cFF9D9D9D	Grey		
						--  |cFF4FE34F	Green		Teleport (N)
						--  |cFFFFFFFF	White		
						--  |cFF4FAFE3	Blue		Teleport (A)
						--  |cFFE34F4F	Red			Teleport (H)
						--  |cFFFFD100	Gold		
						--	|cFFFFD700	Gold2		
						--  |cFFE3E34F	Yellow		
						--  |cFF1E1E1E	DarkGrey	
