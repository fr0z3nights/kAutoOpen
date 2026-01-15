local kAutoOpen03 = CreateFrame('Frame')

kAutoOpen03:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	03	WORLD OF WARCRAFT:	WRATH OF THE LICH KING
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems03 = {

			[202269] = true,	--	SS	Bounty Satchel
			[200240] = true,	--	SS	Northrend Adventuring Supplies
			[200239] = true,	--	SS	Northrend Adventuring Supplies
			[200238] = true,	--	SS	Northrend Adventuring Supplies
			[199210] = true,	--	SS	Northrend Adventuring Supplies
			[ 54516] = true,	--		Loot-Filled Pumpkin
			[ 54467] = true,	--	SS	Tabard Lost & Found
			[ 52676] = true,	--		Cache of the Ley-Guardian
			[ 52344] = true,	--		Earthen Ring Supplies
			[ 52304] = true,	--		Fire Prism
			[ 52274] = true,	--		Earthen Ring Supplies
			[ 52006] = true,	--		Sack of Frosty Treasures
			[ 52005] = true,	--		Satchel of Helpful Goods
			[ 52004] = true,	--		Satchel of Helpful Goods
			[ 52003] = true,	--		Satchel of Helpful Goods
			[ 52002] = true,	--		Satchel of Helpful Goods
			[ 52001] = true,	--		Satchel of Helpful Goods
			[ 52000] = true,	--		Satchel of Helpful Goods
			[ 51999] = true,	--		Satchel of Helpful Goods
			[ 51316] = true,	--		Unsealed Chest
			[ 50409] = true,	--		Spark's Fossil Finding Kit
			[ 50301] = true,	--		Landro's Pet Box
			[ 50238] = true,	--		Cracked Un'Goro Coconut
			[ 49926] = true,	--		Brazie's Black Book of Secrets
			[ 49909] = true,	--		Box of Chocolates
			[ 49631] = true,	--		Standard Apothecary Serving Kit
			[ 49369] = true,	--		Red Blizzcon Bag
			[ 49294] = true,	--		Ashen Sack of Gems
			[ 46812] = true,	--		Northrend Mystery Gem Pouch
			[ 46810] = true,	--		Bountiful Cookbook
			[ 46809] = true,	--		Bountiful Cookbook
		--	[ 46110] = false,	--	PF	Alchemist's Cache -- Alchemist only
			[ 46007] = true,	--		Bag of Fishing Treasures
		--	[ 45986] = false,	--	LP	Tiny Titanium Lockbox
		--	[ 45878] = true,	--	SS	Large Sack of Ulduar Spoils (Drops from Raid Boss)
		--	[ 45875] = true,	--	SS	Sack of Ulduar Spoils (Drops from Raid Boss)
			[ 45724] = true,	--		Champion's Purse
			[ 45328] = true,	--		Bloated Slippery Eel
			[ 44951] = true,	--		Box of Bombs
			[ 44943] = true,	--		Icy Prism
			[ 44751] = true,	--		Hyldnir Spoils
			[ 44718] = true,	--		Ripe Disgusting Jar
		--	[ 44700] = true,	--	NO	Brooding Darkwater Clam
			[ 44663] = true,	--		Abandoned Adventurer's Satchel
			[ 44475] = true,	--		Reinforced Crate
			[ 44163] = true,	--		Shadowy Tarot
			[ 44161] = true,	--		Arcane Tarot
			[ 44142] = true,	--		Strange Tarot
			[ 44113] = true,	--		Small Spice Bag
		--	[ 43624] = false,	--	LP	Titanium Lockbox
		--	[ 43622] = false,	--	LP	Froststeel Lockbox
		--	[ 43575] = false,	--	LP	Reinforced Junkbox
			[ 43556] = true,	--		Patroller's Pack
			[ 43347] = true,	--		Satchel of Spoils
		--	[ 43346] = true,	--	SS	Large Satchel of Spoils (Drops from Raid Boss)
			[ 41888] = true,	--		Small Velvet Bag
			[ 41426] = true,	--		Magically Wrapped Gift
			[ 40308] = true,	--	SS	Bonework Soul Jar
			[ 39904] = true,	--	SS	Argent Crusade Gratuity
			[ 39903] = true,	--	SS	Argent Crusade Gratuity
			[ 39883] = true,	--		Cracked Egg
			[ 39418] = true,	--		Ornately Jeweled Box
			[ 38539] = true,	--	SS	Sack of Gold
			[ 37605] = true,	--	SS	Pouch of Pennies
			[ 37168] = true,	--		Mysterious Tarot
		--	[ 36781] = false,	--	NO	Darkwater Clam
			[ 35945] = true,	--		Brilliant Glass
			[ 35792] = true,	--		Mage Hunter Personal Effects
			[ 35745] = true,	--	SS	Box of Treasure
			[ 35512] = true,	--		Pocket Full of Snow
			[ 35348] = true,	--		Bag of Fishing Treasures
			[ 35313] = true,	--		Bloated Barbed Gill Trout
			[ 35286] = true,	--		Bloated Giant Sunfish
			[ 35232] = true,	--		Shattered Sun Supplies
			[ 34871] = true,	--		Crafty's Sack

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen03:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen03:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen03:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen03:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen03:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen03:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen03:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen03:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen03:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen03:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < (kAutoOpen_GetCooldown and kAutoOpen_GetCooldown() or 2) then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			local info = C_Container.GetContainerItemInfo(bag, slot)
			local canOpen = info and info.hasLoot and not info.isLocked
			if id and autoOpenItems03[id] and canOpen then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F03 " .. C_Container.GetContainerItemLink(bag, slot))
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
