local kAutoOpen02 = CreateFrame('Frame')

kAutoOpen02:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
	
	--	NOTE:		Ignore "OneDrive Sync:", just added it, so whenever I add something, I can run it and update OneDrive right away... If I remember :P
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
--	02	WORLD OF WARCRAFT:	BURNING CRUSADE
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems02 = {

			[191061] = true,	--	SS	Brilliant Glass
		--	[191060] = true,	--	SS	Black Sack of Gems (Drops from Raid Boss)
			[187799] = true,	--	SS	Enlistment Bonus
			[187714] = true,	--	SS	Enlistment Bonus
			[ 34863] = true,	--		Bag of Fishing Treasures
		--	[ 34846] = true,	--	SS	Black Sack of Gems (Drops from Raid Boss)
			[ 34595] = true,	--		Aldor Supplies Package
			[ 34594] = true,	--		Scryer Supplies Package
			[ 34593] = true,	--		Scryer Supplies Package
			[ 34592] = true,	--		Aldor Supplies Package
			[ 34587] = true,	--		Aldor Supplies Package
			[ 34585] = true,	--		Scryer Supplies Package
			[ 34584] = true,	--		Scryer Supplies Package
			[ 34583] = true,	--		Aldor Supplies Package
			[ 34548] = true,	--	SS	Cache of the Shattered Sun
			[ 34503] = true,	--	SS	Box of Adamantite Shells
			[ 34119] = true,	--		Black Conrad's Treasure
			[ 34077] = true,	--		Crudely Wrapped Gift
			[ 33928] = true,	--		Hollowed Bone Decanter
			[ 33926] = true,	--		Sealed Scroll Case
			[ 33857] = true,	--		Crate of Meat
			[ 33844] = true,	--		Barrel of Fish
			[ 33045] = true,	--		Renn's Supplies
			[ 32835] = true,	--		Ogri'la Care Package
			[ 32777] = true,	--		Kronk's Grab Bag
			[ 32724] = true,	--		Sludge-Covered Object
			[ 32631] = true,	--		Small Silver Metamorphosis Geode
			[ 32630] = true,	--		Small Gold Metamorphosis Geode
			[ 32629] = true,	--		Large Gold Metamorphosis Geode
			[ 32628] = true,	--		Large Silver Metamorphosis Geode
			[ 32627] = true,	--		Small Copper Metamorphosis Geode
			[ 32626] = true,	--		Large Copper Metamorphosis Geode
			[ 32625] = true,	--		Small Iron Metamorphosis Geode
			[ 32624] = true,	--		Large Iron Metamorphosis Geode 
			[ 32561] = true,	--	SS	Tier 5 Arrow Box
			[ 32462] = true,	--		Morthis' Materials
			[ 32064] = true,	--		Protectorate Treasure Cache
			[ 31955] = true,	--		Arelion's Knapsack
		--	[ 31952] = false,	--	LP	Khorium Lockbox
			[ 31800] = true,	--		Outcast's Cache
			[ 31522] = true,	--		Primal Mooncloth Supplies
			[ 31408] = true,	--		Offering of the Sha'tar
			[ 30650] = true,	--		Dertrok's Wand Case
			[ 30320] = true,	--		Bundle of Nether Spikes
			[ 30260] = true,	--		Voren'thal's Package
		--	[ 29569] = false,	--	LP	Strong Junkbox
			[ 28499] = true,	--	SS	Arakkoa Hunter's Supplies
			[ 28135] = true,	--	SS	Bomb Crate
		--	[ 27513] = false,	--	NO	Curious Crate
			[ 27511] = true,	--		Inscribed Scrollcase
			[ 27481] = false,	--		Heavy Supply Crate
			[ 27446] = true,	--		Mr. Pinchy's Gift
			[ 25424] = true,	--		Gem-Stuffed Envelope
			[ 25423] = true,	--		Bag of Premium Gems
			[ 25422] = true,	--		Bulging Sack of Gems
			[ 25419] = true,	--		Unmarked Bag of Gems
		--	[ 24476] = false,	--	NO	Jaggal Clam
			[ 24402] = true,	--		Package of Identified Plants
			[ 24336] = true,	--		Fireproof Satchel
			[ 23921] = true,	--		Bulging Sack of Silver
			[ 23895] = true,	--	SS	Netted Goods
			[ 23846] = true,	--		Nolkai's Box

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen02:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen02:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen02:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen02:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen02:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen02:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen02:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen02:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen02:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen02:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < 1.5 then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems02[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F02 " .. C_Container.GetContainerItemLink(bag, slot))
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
