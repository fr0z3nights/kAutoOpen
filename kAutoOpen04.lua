local kAutoOpen04 = CreateFrame('Frame')

kAutoOpen04:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

local atBank, atMail, atMerchant, isLooting
kAutoOpen_LastOpenTime = kAutoOpen_LastOpenTime or 0

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	KEY
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

	--	Some items I didn't find, I copied them from the below alternative/companion addons, Thanks to the author(s).
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
	
	--	NOTE:		Ignore "My OneDrive Sync:", just added it, so whenever I add something, I can run it and update OneDrive right away... If I remember :P
	--	OneDrive:	https://1drv.ms/f/s!AiSfe94wb0vWjQarA4JNTkq0uMfl

	--	Added these here to open other parts when I need to edit them			--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenMX.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen11.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenEV.lua		
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen10.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen09.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen08.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen07.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen06.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen05.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen04.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen03.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen02.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen01.lua
		--	WoW is in the default directory, Created a secondary path "C:\WoW\" with junction https://learn.microsoft.com/en-us/sysinternals/downloads/junction)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	04	WORLD OF WARCRAFT:	CATACLYSM
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems04 = {

			[ 71631] = true,	--		Zen'Vorka's Cache
			[ 70931] = true,	--		Scrooge's Payoff
			[ 70719] = true,	--		Water-Filled Gills
			[ 69999] = true,	--		Moat Monster Feeding Kit
			[ 69903] = true,	--		Satchel of Exotic Mysteries
			[ 69886] = true,	--		Bag of Coins
			[ 69823] = true,	--		Gub's Catch
			[ 69822] = true,	--		Master Chef's Groceries
			[ 69818] = true,	--		Giant Sack
			[ 69817] = true,	--		Hive Queen's Honeycomb
			[ 68813] = true,	--		Satchel of Freshly-Picked Herbs
			[ 68795] = true,	--		Stendel's Bane
		--	[ 68729] = false,	--	LP	Elementium Lockbox
			[ 68689] = true,	--		Imported Supplies
			[ 68598] = true,	--		Very Fat Sack of Coins
			[ 68384] = true,	--		Moonkin Egg
			[ 67597] = true,	--		Sealed Crate
			[ 67539] = true,	--		Tiny Treasure Chest
			[ 67495] = true,	--		Strange Bloated Stomach
			[ 67414] = true,	--		Bag of Shiny Things
			[ 67250] = true,	--		Satchel of Helpful Goods
			[ 67248] = true,	--		Satchel of Helpful Goods
			[ 66943] = true,	--		Treasures from Grim Batol
			[ 65513] = true,	--		Crate of Tasty Meat
			[ 64657] = true,	--		Canopic Jar
			[ 64491] = true,	--		Royal Reward
		--	[ 63349] = false,	--	LP	Flame-Scarred Junkbox
			[ 62062] = true,	--		Bulging Sack of Gold
			[ 61387] = true,	--		Hidden Stash
			[ 60681] = true,	--		Cannary's Cache
			[ 57540] = true,	--		Coldridge Mountaineer's Pouch
			[ 54536] = true,	--		Satchel of Chilled Goods

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen04:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen04:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen04:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen04:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen04:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen04:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen04:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen04:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen04:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen04:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < 1.5 then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			local info = C_Container.GetContainerItemInfo(bag, slot)
			local canOpen = info and info.hasLoot and not info.isLocked
			if id and autoOpenItems04[id] and canOpen then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F04 " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				kAutoOpen_LastOpenTime = GetTime()
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
