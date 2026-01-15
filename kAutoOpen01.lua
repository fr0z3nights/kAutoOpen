local kAutoOpen01 = CreateFrame('Frame')

kAutoOpen01:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	01	WORLD OF WARCRAFT
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems01 = {

			[ 23224] = true,	--	SS	Summer Gift Package
			[ 23022] = true,	--		Curmudgeon's Payoff
			[ 22746] = true,	--		Buccaneer's Uniform
			[ 22650] = true,	--		Hive'Zora Dossier
			[ 22649] = true,	--		Hive'Regal Dossier
			[ 22648] = true,	--		Hive'Ashi Dossier
			[ 22568] = true,	--		Sealed Craftsman's Writ
			[ 22320] = true,	--		Mux's Quality Goods
			[ 22178] = true,	--		Pledge of Friendship: Stormwind
			[ 22172] = true,	--		Gift of Friendship: Undercity
			[ 22171] = true,	--		Gift of Friendship: Thunder Bluff
			[ 22170] = true,	--		Gift of Friendship: Stormwind
			[ 22169] = true,	--		Gift of Friendship: Orgrimmar
			[ 22168] = true,	--		Gift of Friendship: Ironforge
			[ 22167] = true,	--		Gift of Friendship: Darnassus
			[ 22166] = true,	--		Gift of Adoration: Undercity
			[ 22165] = true,	--		Gift of Adoration: Thunder Bluff
			[ 22164] = true,	--		Gift of Adoration: Orgrimmar
			[ 22163] = true,	--		Pledge of Friendship: Undercity
			[ 22162] = true,	--		Pledge of Friendship: Thunder Bluff
			[ 22161] = true,	--		Pledge of Friendship: Orgrimmar
			[ 22160] = true,	--		Pledge of Friendship: Ironforge
			[ 22159] = true,	--		Pledge of Friendship: Darnassus
			[ 22158] = true,	--		Pledge of Adoration: Thunder Bluff
			[ 22157] = true,	--		Pledge of Adoration: Undercity
			[ 22156] = true,	--		Pledge of Adoration: Orgrimmar
			[ 22155] = true,	--		Pledge of Adoration: Darnassus
			[ 22154] = true,	--		Pledge of Adoration: Ironforge
			[ 22152] = true,	--	SS	Anthion's Pouch
			[ 22137] = true,	--		Ysida's Satchel
			[ 21981] = true,	--		Gift of Adoration: Stormwind
			[ 21980] = true,	--		Gift of Adoration: Ironforge
			[ 21979] = true,	--		Gift of Adoration: Darnassus
			[ 21975] = true,	--		Pledge of Adoration: Stormwind
			[ 21812] = true,	--		Box of Chocolates
		--	[ 21743] = false,	--	PF	Large Cluster Rocket Recipes
		--	[ 21742] = false,	--	PF	Large Rocket Recipes
		--	[ 21741] = false,	--	PF	Cluster Rocket Recipes
		--	[ 21740] = false,	--	PF	Small Rocket Recipes
			[ 21640] = true,	--		Lunar Festival Fireworks Pack
			[ 21528] = true,	--		Colossal Bag of Loot
			[ 21513] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21512] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21511] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21510] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21509] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21386] = true,	--		Followup Logistics Assignment
			[ 21266] = true,	--		Logistics Assignment
			[ 21243] = true,	--	SS	Bloated Mightfish
			[ 21228] = true,	--	FF	Mithril Bound Trunk						-- Find Fish Book (For Alts)
			[ 21164] = true,	--		Bloated Rockscale Cod
			[ 21163] = true,	--	SS	Bloated Firefin
			[ 21162] = true,	--	SS	Bloated Oily Blackmouth
			[ 21156] = true,	--		Scarab Bag
			[ 21150] = true,	--	FF	Iron Bound Trunk						-- Find Fish Book (For Alts)
			[ 21133] = true,	--		Followup Tactical Assignment
			[ 21132] = true,	--		Logistics Assignment
			[ 21131] = true,	--		Followup Combat Assignment
			[ 21113] = true,	--	FF	Watertight Trunk						-- Find Fish Book (For Alts)
			[ 21042] = true,	--		Narain's Special Kit
			[ 20809] = true,	--		Tactical Assignment
			[ 20808] = true,	--		Combat Assignment
			[ 20805] = true,	--		Followup Logistics Assignment
			[ 20768] = true,	--		Oozing Bag
			[ 20767] = true,	--		Scum Covered Bag
			[ 20766] = true,	--		Slimy Bag
			[ 20708] = true,	--	FF	Tightly Sealed Trunk					-- Find Fish Book (For Alts)
			[ 20603] = true,	--		Bag of Spoils
			[ 20602] = true,	--		Chest of Spoils
			[ 20601] = true,	--		Sack of Spoils
			[ 20469] = true,	--		Decoded True Believer Clippings
			[ 20393] = true,	--	SS	Treat Bag
			[ 20367] = true,	--	SS	Hunting Gear
			[ 20236] = true,	--		Arathor Standard Care Package
			[ 20233] = true,	--		Arathor Basic Care Package
			[ 20231] = true,	--		Arathor Advanced Care Package
			[ 20230] = true,	--		Defiler's Standard Care Package
			[ 20229] = true,	--		Defiler's Basic Care Package
			[ 20228] = true,	--		Defiler's Advanced Care Package
		--	[ 19425] = false,	--	LP	Mysterious Lockbox
			[ 19422] = true,	--		Darkmoon Faire Fortune
			[ 19298] = true,	--		Minor Darkmoon Prize
			[ 19297] = true,	--		Lesser Darkmoon Prize
			[ 19296] = true,	--		Greater Darkmoon Prize
			[ 19155] = true,	--		Outrider Standard Care Package
			[ 19154] = true,	--		Outrider Basic Care Package
			[ 19153] = true,	--		Outrider Advanced Care Package
			[ 19152] = true,	--		Sentinel Advanced Care Package
			[ 19151] = true,	--		Sentinel Standard Care Package
			[ 19150] = true,	--		Sentinel Basic Care Package
			[ 19035] = true,	--		Lard's Special Picnic Basket
			[ 18804] = true,	--		Lord Grayson's Satchel
			[ 18636] = true,	--	SS	Ruined Jumper Cables XL
			[ 17969] = true,	--		Red Sack of Gems
			[ 17965] = true,	--		Yellow Sack of Gems
			[ 17964] = true,	--		Gray Sack of Gems
			[ 17963] = true,	--		Green Sack of Gems
			[ 17962] = true,	--		Blue Sack of Gems
		--	[ 16885] = false,	--	LP	Heavy Junkbox
		--	[ 16884] = false,	--	LP	Sturdy Junkbox
		--	[ 16883] = false,	--	LP	Worn Junkbox
		--	[ 16882] = false,	--	LP	Battered Junkbox
			[ 16783] = true,	--	SS	Bundle of Reports
			[ 15902] = true,	--		A Crazy Grab Bag
			[ 15876] = true,	--		Nathanos' Chest
		--	[ 15874] = false,	--	NO	Soft-shelled Clam
			[ 15699] = true,	--		Small Brown-Wrapped Package
			[ 15103] = true,	--		Corrupt Tested Sample
			[ 15102] = true,	--		Un'Goro Tested Sample
		--	[ 13918] = false,	--	LP	Reinforced Locked Chest
			[ 13891] = true,	--		Bloated Salmon
			[ 13881] = true,	--		Bloated Redgill
		--	[ 13875] = false,	--	LP	Ironbound Locked Chest
			[ 13874] = true,	--		Heavy Crate
			[ 13247] = true,	--	SS	Quartermaster Zigris' Footlocker	Not [22233]
			[ 12849] = true,	--		Demon Kissed Sack
			[ 12339] = true,	--		Vaelan's Gift
			[ 12122] = true,	--		Kum'isha's Junk
		--	[ 12033] = false,	--	LP	Thaurissan Family Jewels
			[ 11966] = true,	--		Small Sack of Coins
			[ 11955] = true,	--		Bag of Empty Ooze Containers
			[ 11938] = true,	--		Sack of Gems
			[ 11937] = true,	--		Fat Sack of Coins
			[ 11912] = true,	--		Package of Empty Ooze Containers
			[ 11887] = true,	--		Cenarion Circle Cache
			[ 11883] = true,	--		A Dingy Fanny Pack
			[ 11617] = true,	--		Eridan's Supplies
			[ 11568] = true,	--		Torwa's Pouch
			[ 11423] = true,	--		Gnome Engineer's Renewal Gift
			[ 11422] = true,	--		Goblin Engineer's Renewal Gift
			[ 11107] = true,	--		A Small Pack
			[ 11024] = true,	--		Evergreen Herb Casing
			[ 10834] = true,	--		Felhound Tracker Kit
			[ 10773] = true,	--		Hakkari Urn
			[ 10752] = true,	--		Emerald Encrusted Chest
			[ 10695] = true,	--		Box of Empty Vials
			[ 10595] = true,	--	SS	Kum'isha's Junk
			[ 10569] = true,	--		Hoard of the Black Dragonflight
			[ 10479] = true,	--		Kovic's Trading Satchel
			[ 10456] = true,	--		A Bulging Coin Purse
			[  9541] = true,	--		Box of Goodies
			[  9540] = true,	--		Box of Spells
			[  9539] = true,	--		Box of Rations
			[  9537] = true,	--	SS	Neatly Wrapped Box
			[  9532] = true,	--	SS	Internal Warrior Equipment Kit L30
			[  9529] = true,	--	SS	Internal Warrior Equipment Kit L25
			[  9363] = true,	--		Sparklematic-Wrapped Box
			[  9276] = true,	--		Pirate's Footlocker
			[  9265] = true,	--		Cuergo's Hidden Treasure
			[  8647] = true,	--		Egg Crate
			[  8507] = true,	--	SS	Heavy Mithril Lotterybox
			[  8506] = true,	--	SS	Mithril Lotterybox
			[  8505] = true,	--	SS	Heavy Iron Lotterybox
			[  8504] = true,	--	SS	Iron Lotterybox
			[  8503] = true,	--	SS	Heavy Bronze Lotterybox
			[  8502] = true,	--	SS	Bronze Lotterybox
			[  8484] = true,	--		Gadgetzan Water Co. Care Package
			[  8366] = true,	--		Bloated Trout
			[  8049] = true,	--		Gnarlpine Necklace
		--	[  7973] = false,	--	NO	Big-Mouth Clams
		--	[  7870] = false,	--	LP	Thaumaturgy Vessel Lockbox
		--	[  7209] = false,	--	LP	Tazan's Satchel
			[  7190] = true,	--		Scorched Rocket Boots
			[  6827] = true,	--		Box of Supplies
			[  6755] = true,	--		A Small Container of Gems
			[  6715] = true,	--		Ruined Jumper Cables
			[  6647] = true,	--		Bloated Catfish
			[  6646] = true,	--	SS	Bloated Albacore
			[  6645] = true,	--		Bloated Mud Snapper
			[  6644] = true,	--	SS	Bloated Mackerel
			[  6643] = true,	--		Bloated Smallfish
			[  6357] = true,	--		Sealed Crate
			[  6356] = true,	--		Battered Chest
		--	[  6355] = false,	--	LP	Sturdy Locked Chest
		--	[  6354] = false,	--	LP	Small Locked Chest 
			[  6353] = true,	--		Small Chest
			[  6352] = true,	--		Waterlogged Crate
			[  6351] = true,	--		Dented Crate
			[  6307] = true,	--		Message in a Bottle
			[  5858] = true,	--	SS	Goblin Prize Box
			[  5857] = true,	--	SS	Gnome Prize Box
		--	[  5760] = false,	--	LP	Eternium Lockbox
		--	[  5759] = false,	--	LP	Thorium Lockbox
		--	[  5758] = false,	--	LP	Mithril Lockbox
			[  5738] = true,	--		Covert Ops Pack
		--	[  5524] = false,	--	NO	Thick-shelled Clam
		--	[  5523] = false,	--	NO	Small Barnacled Clam
			[  5335] = true,	--		A Sack of Coins
		--	[  4638] = false,	--	LP	Reinforced Steel Lockbox
		--	[  4637] = false,	--	LP	Steel Lockbox
		--	[  4636] = false,	--	LP	Strong Iron Lockbox
		--	[  4634] = false,	--	LP	Iron Lockbox
		--	[  4633] = false,	--	LP	Heavy Bronze Lockbox
		--	[  4632] = false,	--	LP	Ornate Bronze Lockbox

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen01:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen01:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen01:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen01:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen01:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen01:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen01:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen01:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen01:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen01:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < (kAutoOpen_GetCooldown and kAutoOpen_GetCooldown() or 2) then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			local info = C_Container.GetContainerItemInfo(bag, slot)
			local canOpen = info and info.hasLoot and not info.isLocked
			if id and autoOpenItems01[id] and canOpen then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F01 " .. C_Container.GetContainerItemLink(bag, slot))
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
