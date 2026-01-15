local kAutoOpen10 = CreateFrame('Frame')

kAutoOpen10:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

local atBank, atMail, atMerchant, isLooting

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
--	10	WORLD OF WARCRAFT:	DRAGONFLIGHT
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems10 = {

			[218130] = true,	--		Adventurer's Footlocker
			[217111] = true,	--		Cache of Awakened Dreams
			[217110] = true,	--		Cache of Awakened Embers
			[217109] = true,	--		Cache of Awakened Storms
			[215364] = true,	--		Cache of Dreams
			[215363] = true,	--		Cache of Embers
			[215362] = true,	--		Cache of Storms
			[213429] = true,	--		Meticulous Archivist's Appendix
			[213190] = true,	--		Preserved Djaradin Tome
			[213189] = true,	--		Preserved Dragonkin Tome
			[213188] = true,	--		Dusty Dracthyr Tome
			[213187] = true,	--		Dusty Drakonid Tome
			[213186] = true,	--		Dusty Niffen Tome
			[213185] = true,	--		Dusty Centaur Tome
			[213177] = true,	--		Immaculate Tome
			[213176] = true,	--		Preserved Isles Tome
			[213175] = true,	--		Dusty Djaradin Tome
			[211414] = true,	--		Blossoming Dreamtrove
			[211413] = true,	--		Budding Dreamtrove
			[211411] = true,	--		Sprouting Dreamtrove
			[211410] = true,	--		Bloomed Wilding Cache
			[211394] = true,	--		Harvested Dreamseed Cache
			[211389] = true,	--		Cache of Overblooming Treasures
			[211373] = true,	--		Bag of Many Wonders
			[211303] = true,	--		Dryad's Supply Pouch
			[210872] = true,	--		Satchel of Dreams
			[210549] = true,	--		Dream Racer's Purse
			[210063] = true,	--		Invader's Satchel of Helpful Goods
			[210062] = true,	--		Ironbound Satchel of Helpful Goods			Looted 250711
			[208878] = true,	--		Adventurer's Footlocker						Looted 250627
			[208090] = true,	--		Contained Paracausality
			[208054] = true,	--		Mystery Box
			[207584] = true,	--		Box of Volatile Reality
			[207583] = true,	--		Box of Collapsed Reality
			[207582] = true,	--		Box of Tampered Reality
			[206135] = true,	--	OW	Heroic Dungeon Delver's Trophy Chest
			[205983] = true,	--	OW	Scentsational Niffen Treasures
			[205966] = true,	--		Cache of Aberrus Treasures
			[205964] = true,	--	OW	Small Loammian Supply Pack
			[205877] = true,	--		Adventurer's Footlocker
			[205373] = true,	--	OW	Researcher's Scrounged Goods
			[205371] = true,	--	OW	Appreciative Researcher's Scrounged Goods
			[205370] = true,	--	OW	Researcher'S Gift
			[205369] = true,	--		Appreciative Researcher's Gift
			[205367] = true,	--		Indebted Researcher's Gift
			[205347] = true,	--		Gathered Niffen Resources
			[205346] = true,	--	OW	Hidden Niffen Treasure
			[205288] = true,	--		Buried Niffen Collection
			[205248] = true,	--	OW	
			[205247] = true,	--		Clinking Dirt-Covered Pouch
			[205226] = true,	--	OW	Cavern Racer's Purse
			[204724] = true,	--	OW	Drake's Small Chest
			[204381] = true,	--	OW	Brimming Valdrakken Accord Supply Pack
			[204378] = true,	--	OW	Brimming Dragonscale Expedition Supply Pack
			[204359] = true,	--		Reach Raver's Purse
			[203681] = true,	--	BG	Stormed Primalist Cache
			[203476] = true,	--	BG	Primalist Cache
			[203450] = true,	--	BG	Bottomless Bag of Skins
			[203449] = true,	--	BG	Bottomless Bag of Herbs
			[203448] = true,	--	BG	Bottomless Bag of Ore
			[203447] = true,	--	BG	Bottomless Bag of Optional Goods
			[203444] = true,	--	BG	Bottomless Bag of General Goods
			[203441] = true,	--	BG	Bottomless Bag of Tailoring Goods
			[203440] = true,	--	BG	Bottomless Bag of Leatherworking Goods
			[203439] = true,	--	BG	Bottomless Bag of Jewelcrafting Goods
			[203438] = true,	--	BG	Bottomless Bag of Inscription Goods
			[203437] = true,	--	BG	Bottomless Bag of Engineering Goods
			[203436] = true,	--	BG	Bottomless Bag of Enchanting Goods
			[203435] = true,	--	BG	Bottomless Bag of Alchemy Goods
			[203434] = true,	--	BG	Bottomless Bag of Blacksmithing Goods
			[202371] = true,	--	BG	Glowing Primalist Cache
			[202172] = true,	--	BG	Overflowing Satchel of Coins
			[202171] = true,	--	BG	Dragon Purse
			[202142] = true,	--	OW	Dragonbane Keep Strongbox
			[202122] = true,	--	BG	Primal Chaos Cluster
			[202104] = true,	--	BG	Weighted Sac of Swog Treasures
			[202103] = true,	--	BG	Immaculate Sac of Swog Treasures
			[202102] = true,	--	BG	Immaculate Sac of Swog Treasures
			[202101] = true,	--	BG	Topped Trunk of Disenchanted Detritus
			[202100] = true,	--	BG	Populous Pack of Castoff Cloth
			[202099] = true,	--	BG	Stocked Sack of Hale Herbs
			[202098] = true,	--	BG	Crowded Crate of Mined Materials
			[202097] = true,	--	OW	Bulging Box of Skins and Scales
			[202083] = true,	--	BG	Tyler's Test Box
			[202080] = true,	--	BG	Cache of Vault Treasures
			[202079] = true,	--	BG	Cache of Vault Treasures
			[202058] = true,	--	BG	Timewatcher's Patience
			[202057] = true,	--	BG	Earthwarden's Prize
			[202056] = true,	--	BG	Keeper's Glory
			[202055] = true,	--	BG	Dreamer's Vision
			[202054] = true,	--	BG	Queen's Gift
			[202052] = true,	--	OW	Timewatcher's Patience
			[202051] = true,	--	BG	Earthwarden's Prize
			[202050] = true,	--	BG	Keeper's Glory
			[202049] = true,	--	BG	Dreamer's Vision
			[202048] = true,	--	BG	Queen's Gift
			[201818] = true,	--	BG	Twilight Strongbox
			[201817] = true,	--	OW	Twilight Cache
			[201757] = true,	--	BG	Plundered Supplies
			[201756] = true,	--	BG	Bulging Coin Purse
			[201755] = true,	--	BG	Obsidian Forgemaster's Strongbox
			[201754] = true,	--	OW	Obsidian Forgemaster's Cache
			[201728] = true,	--	OW	Vakril's Strongbox
			[201462] = true,	--	BG	Curiously-Shaped Stomach
			[201439] = true,	--	BG	Renewed Dream
			[201354] = true,	--	BG	Bag of Plate Armor Reagents
			[201353] = true,	--		Bag of Mail Armor Reagents
			[201352] = true,	--	OW	Bag of Leather Reagents
			[201343] = true,	--	BG	Bag of Cloth Armor Reagents
			[201326] = true,	--	BG	Draconic Satchel of Cooperation
			[201299] = true,	--	BG	Docile Frosty Soul
			[201298] = true,	--	BG	Docile Fiery Soul
			[201297] = true,	--	BG	Docile Earthen Soul
			[201296] = true,	--	BG	Docile Airy Soul
			[201252] = true,	--	BG	10.0 Bronze PvP Chest (DNT)
			[201251] = true,	--	BG	Pillaged Contender's Strongbox
			[201250] = true,	--	BG	Victorious Contender's Strongbox
			[200936] = true,	--	BG	Encaged Earthen Soul
			[200934] = true,	--	BG	Encaged Frosty Soul
			[200932] = true,	--	BG	Encaged Airy Soul
			[200931] = true,	--	BG	Encaged Fiery Soul
			[200611] = true,	--	BG	Dragon Racing Purse - Third Place
			[200610] = true,	--	BG	Dragon Racing Purse - Second Place
			[200609] = true,	--	BG	Dragon Racing Purse - First Place
			[200516] = true,	--	BG	Grand Hunt Spoils
			[200515] = true, 	--	OW	Grand Hunt Spoils
			[200513] = true, 	--	OW	Grand Hunt Spoils
			[200477] = true,	--	BG	Stack of VIP Passes
			[200468] = true, 	--	OW	Grand Hunt Spoils
			[200300] = true,	--	BG	Sack of Looted Treasures
			[200156] = true,	--	BG	Amethyzarite Geode
			[200095] = true,	--	OW	Supply-Laden Soup Pot
			[200094] = true,	--	BG	Caravan Strongbox
			[200073] = true,	--	OW	Valdrakken Treasures
			[200072] = true,	--	OW	Dragonbane Keep Strongbox
			[200070] = true,	--	OW	Obsidian Strongbox
			[200069] = true,	--	OW	Obsidian Cache
			[199475] = true,	--	BG	Overflowing Valdrakken Accord Supply Pack
			[199474] = true,	--	BG	Overflowing Maruuk Centaur Supply Satchel
			[199473] = true,	--	BG	Overflowing Iskaaran Supply Pack
			[199472] = true,	--	BG	Overflowing Dragon Expedition Supply Pack
			[199342] = true,	--	BG	Weighted Sac of Swog Treasures
			[199341] = true,	--	BG	Regurgitated Sac of Swog Treasures
			[199192] = true,	--	OW	Dragon Racer's Purse
			[199108] = true,	--	BG	Bag of Discount Goods
			[198869] = true,	--	BG	Large Valdrakken Accord Supply Pack
			[198868] = true,	--	OW	Small Valdrakken Accord Supply Pack
			[198867] = true,	--	BG	Large Iskaaran Supply Pack
			[198866] = true,	--	BG	Small Iskaaran Supply Pack
			[198865] = true,	--	BG	Large Dragon Expedition Supply Pack
			[198864] = true,	--	BG	Large Maruuk Centaur Supply Satchel
			[198863] = true,	--	BG	Small Dragon Expedition Supply Pack
			[198439] = true,	--	BG	Aged Recipe in a Bottle
			[198438] = true,	--	BG	Draconic Recipe in a Bottle
			[198172] = true,	--	BG	Bundle of Fireworks
			[198171] = true,	--	BG	Suspiciously Silent Crate Gold
			[198170] = true,	--	BG	Suspiciously Silent Crate Silver
			[198169] = true,	--	BG	Suspiciously Silent Crate Bronze
			[198168] = true,	--	BG	Suspiciously Ticking Crate Gold
			[198167] = true,	--	BG	Suspiciously Ticking Crate Silver
			[198166] = true,	--	BG	Suspiciously Ticking Crate Bronze
			[194750] = true,	--	BG	Professional Equipment
			[194419] = true,	--	BG	Life Pool Herb Pouch
			[194072] = true,	--		Sack of Gold
			[193376] = true,	--	BG	Adenedal's Tidy Purse
			[192892] = true,	--	OW	Timewatcher's Patience
			[192891] = true,	--	BG	Earthwarden's Prize Bronze
			[192890] = true,	--	BG	Keeper's Glory Bronze
			[192889] = true,	--	BG	Dreamer's Vision Bronze
			[192888] = true,	--	BG	Queen's Gift Bronze
			[189765] = true,	--		Maruuk Centaur Supply Satchel

		--	[205423] = false,	--		Large Shadowflame Residue Sack
		--	[205423] = false,	--		Shadowflame Residue Sack
		--	[204712] = true,	--		Brimming Loamm Niffen Supply Satchel		Cancelled Out For Barter Boulder (Warbound Bag)
		--	[202059] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent
		--	[202053] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent
		--	[198657] = false,	--	LP	Forgotten Jewelry Box
		--	[198395] = false,	--	NO	Dull Spined Clam
		--	[194037] = false,	--	NO	Heavy Chest (Requires Looted Key)
		--	[192893] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent


}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen10:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen10:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen10:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen10:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen10:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen10:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen10:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen10:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen10:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen10:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems10[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F10 " .. C_Container.GetContainerItemLink(bag, slot))
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
