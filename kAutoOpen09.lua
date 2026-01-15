local kAutoOpen09 = CreateFrame('Frame')

kAutoOpen09:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	09	WORLD OF WARCRAFT:	SHADOWLANDS		
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems09 = {

			[192438] = true,	--	BG	Cache of Fated Treasures
			[192437] = true,	--		Cache of Fated Treasures
			[191701] = true,	--	OW	Bag of Explored Souls
			[191303] = true,	--	OW	Overflowing Chest of Riches
			[191302] = true,	--	BG	Bottled Night Sky
			[191301] = true,	--	BG	Treatise on Patterns in the Purpose
		--	[191296] = false,	--	LP	Enchanted Lockbox
			[191203] = true,	--	BG	Dragonscale Expedition Supplies
			[191139] = true,	--		Tribute of the Enlightened Elders
			[191041] = true,	--	BG	Cache of Sepulcher Treasures
			[191040] = true,	--	OW	Cache of Sepulcher Treasures (252+)
			[191030] = true,	--	BG	Cosmic Flux Parcel
		--	[190954] = false,	--	LP	Serevite Lockbox
			[190823] = true,	--	BG	Firim's Mysterious Cache
			[190656] = true,	--	OW	Cache of Sepulcher Treasures (hc))
			[190655] = true,	--	OW	Cache of Sepulcher Treasures
			[190610] = true,	--	OW	Tribute of the Enlightened Elders
			[190382] = true,	--	BG	Warped Pocket Dimension
		--	[190339] = false,	--	OW	Enlightened Offering						Rep Token not a Cache - Use New Openables Addon
			[190178] = true,	--	OW	Pouch of Protogenic Provisions
			[189428] = true,	--	BG	9.2 Pet Battle Playtest Bag of Goodies
			[188796] = true,	--	BG	Cypher Test Item
		--	[188787] = false,	--	LP	Locked Broker Luggage
			[187817] = true,	--	BG	Korthite Crystal Geode
			[187787] = true,	--	OW	Ephemera Orb
			[187781] = true,	--	OW	Olea Cache
			[187780] = true,	--	BG	Enlightened Broker Supplies
			[187659] = true,	--	BG	Adventurer's Footlocker
			[187605] = true,	--	BG	Broken Isles Gem Delivery
			[187604] = true,	--	BG	Broken Isles Enchantment Delivery
			[187601] = true,	--	BG	Broken Isles Leather Delivery
			[187600] = true,	--	BG	Broken Isles Ore Delivery
			[187599] = true,	--	BG	Broken Isles Herb Delivery
			[187598] = true,	--	BG	Broken Isles Cloth Delivery
			[187597] = true,	--	BG	Broken Isles Fish Delivery
			[187596] = true,	--	BG	Broken Isles Meat Delivery
			[187575] = true,	--	OW	Korthian Fishing Cache
			[187573] = true,	--	OW	Brokers Enchanting Mote of Potentation
			[187571] = true,	--	OW	Brokers Mining Mote of Potentation
			[187570] = true,	--	OW	Brokers Skinning Mote of Potentation
			[187569] = true,	--	OW	Brokers Tailoring Mote of Potentation
			[187577] = true,	--	OW	Korthian Meat Cache
			[187576] = true,	--	OW	Korthian Skinning Cache
			[187574] = true,	--	OW	Brokers Overflowing Bucket
			[187572] = true,	--	OW	Brokers Herbalism Mote of Potentation
			[187551] = true,	--	OW	Small Korthian Supply Chest
			[187543] = true,	--		Death's Advance War Chest
			[187503] = true,	--	BG	Bundle of Archived Research
			[187502] = true,	--	BG	Byron Test Relic Fragments Box (Immediate)
			[187494] = true,	--	BG	Byron Test Relic Fragments Box
			[187440] = true,	--	OW	Feather-Stuffed Helm
			[187354] = true,	--	OW	Abandoned Broker Satchel
		--	[187351] = true,	--	OW	Stygic Cluster								Bind on Account
			[187346] = true,	--	BG	Lost Memento
			[187278] = true,	--	OW	Talon-Pierced Mawsworn Lockbox
			[187254] = true,	--	BG	Arrangement of Anima
			[187222] = true,	--	BG	Stygic Singularity
			[187221] = true,	--	BG	Soul Ash Cache
			[187182] = true,	--	BG	Hatching Corpsefly Egg
			[187029] = true,	--	OW	Mysterious Gift from Ve'nari
			[187028] = true,	--	OW	Supplies of the Archivists' Codex
			[186971] = true,	--	BG	Feeder's Hand
			[186970] = true,	--	OW	Feeder's Hand and Key
			[186708] = true,	--	OW	Gold Filled Paint Brush Cup
			[186707] = true,	--	OW	Gold Filled Crate
			[186706] = true,	--	OW	Gold Filled Hat
			[186705] = true,	--	OW	Gold Filled Chalice
			[186694] = true,	--	BG	Shaded Bag of Ore
			[186693] = true,	--	OW	Gold Filled Wheelbarrow
			[186692] = true,	--	BG	Gold Filled Helmet
			[186691] = true,	--	OW	Gold Filled Satchel
			[186690] = true,	--	BG	Gold Filled Barrel
			[186688] = true,	--	OW	Gold Filled Wash Bucket
			[186680] = true,	--	OW	Gold Filled Boot
			[186650] = true,	--	OW	Death's Advance Supplies
			[186533] = true,	--	OW	Cache of SAnctum Treasues (hc)
			[186531] = true,	--		Cache of Sanctum Treasures
			[186196] = true,	--		Death's Advance War Chest
		--	[186161] = false,	--	LP	Stygian Lockbox
		--	[186160] = false,	--	LP	Locked Artifact Case
			[185993] = true,	--		Ascended War Chest
			[185992] = true,	--	OW	War Chest of the Undying Army
			[185991] = true,	--	OW	War Chest of the Wild Hunt
			[185990] = true,	--		Harvester's War Chest
			[185972] = true,	--	OW	Tormentor's Cache
		--	[185940] = true,	--		Pristine Survival Kit					Not Instant Open		Level 60 Character Boost
			[185834] = true,	--	BG	Orboreal Distinguishment
			[185833] = true,	--	BG	Shipment of Lightless Silk
			[185832] = true,	--	OW	Shipment of Elethium Ore
			[185765] = true,	--	BG	Shipment of Heavy Callous Hide
			[184869] = true,	--	OW	Cache of Nathrian Treasures
			[184868] = true,	--	OW	Cache of Nathrian Treasures (hc)
		--	[184866] = false,	--	NO	Grummlepouch							Item Not Bag Stupidly
			[184843] = true,	--	OW	Salvaged Supplies
			[184812] = true,	--	BG	Apolon's Bounty
			[184811] = true,	--	BG	Artemede's Bounty
			[184810] = true,	--	BG	Plundered Supplies
			[184648] = true,	--	OW	Hero's Enchanting Cache
			[184647] = true,	--	OW	Hero's Herbalism Cache
			[184646] = true,	--	OW	Hero's Mining Cache
			[184645] = true,	--	OW	Hero's Skinning Cache
			[184644] = true,	--	OW	Hero's Tailoring Cache
			[184643] = true,	--	OW	Champion's Enchanting Cache
			[184642] = true,	--	OW	Champion's Herbalism Cache
			[184641] = true,	--	OW	Champion's Mining Cache	
			[184640] = true,	--	OW	Champion's Skinning Cache
			[184639] = true,	--	OW	Champion's Tailoring Cache
			[184638] = true,	--	OW	Hero's Fish Cache
			[184637] = true,	--	OW	Hero's Meat Cache
			[184636] = true,	--	OW	Adventurer's Skinning Cache
			[184635] = true,	--		Adventurer's Mining Cache
			[184634] = true,	--	OW	Adventurer's Herbalism Cache
			[184633] = true,	--	OW	Champion's Meat Cache
			[184632] = true,	--	OW	Champion's Fish Cache
			[184631] = true,	--	OW	Adventurer's Enchanting Cache
			[184630] = true,	--	OW	Adventurer's Tailoring Cache
			[184627] = true,	--	BG	Sacrificial Red Envelope
			[184589] = true,	--	BG	Bag of Potions
			[184584] = true,	--	BG	Byron Test Callings Box
			[184522] = true,	--		Veiled Satchel of Cooperation
			[184444] = true,	--	BG	Supplies for the Path
			[184395] = true,	--		Fallen Adventurer's Cache
			[184158] = true,	--	BG	Oozing Necroray Egg
			[184103] = true,	--	BG	Cracked Blight-Touched Egg
			[184048] = true,	--	OW	Weapon Satchel of the Wild Hunt
			[184047] = true,	--	OW	Ascended Chest of Arms
			[184046] = true,	--	OW	Undying Army Weapon Cache
			[184045] = true,	--	OW	Martial Tithe of the Court of Harvesters
			[183886] = true,	--	BG	Sika's Rare Ore Pouch
			[183885] = true,	--	BG	Sika's Spare Ore Pouch
			[183884] = true,	--	BG	Pocketful of Assorted Nuggets
			[183883] = true,	--	BG	Bulging Collection of Random Bits
			[183882] = true,	--	BG	Collection of Random Bits
			[183835] = true,	--	BG	Crate of Zandalari Archaeology Fragments
			[183834] = true,	--	BG	Crate of Drust Archaeology Fragments
			[183822] = true,	--		Icecrown Survival Kit
			[183703] = true,	--	OW	Bonesmith's Satchel
			[183702] = true,	--	OW	Nature's Splendor
			[183701] = true,	--		Cleansing Rite Materials
			[183699] = true,	--	OW	Exquisite Ingredients
			[183429] = true,	--	BG	Stitched Satchel of Venthyr Goods
			[183428] = true,	--	BG	Stitched Satchel of Aspirant Goods
			[183426] = true,	--	BG	Stitched Satchel of Fae Goods
			[183424] = true,	--	BG	Stitched Satchel of Maldraxxi Goods
			[182591] = true,	--	BG	Vinecovered Infused Rubies
			[182590] = true,	--	BG	Vinewormed Coin Pouch
			[182114] = true,	--	BG	Assorted Parts and 'Things'
			[181780] = true,	--	BG	An Undelivered Tradesman's Shipment
			[181779] = true,	--	BG	A "Wrapped" Weapon
			[181778] = true,	--	BG	Sack of Shinies
			[181767] = true,	--	BG	Small Coin Purse
			[181741] = true,	--		Tribute of the Paragon
			[181739] = true,	--	BG	Bag of Soul Ash
			[181733] = true,	--		Tribute of the Duty-Bound
			[181732] = true,	--		Tribute of the Ambitious
			[181557] = true,	--		Favor of the Court
			[181556] = true,	--		Tribute of the Court
			[181476] = true,	--		Tribute of the Wild Hunt
			[181475] = true,	--		Bounty of the Grove Warden
			[181372] = true,	--		Tribute of the Ascended
			[180989] = true,	--	BG	Novice's Overflowing Satchel
			[180988] = true,	--	BG	Journeyman's Overflowing Satchel
			[180985] = true,	--	BG	Novice's Stuffed Satchel
			[180984] = true,	--	BG	Journeyman's Stuffed Satchel
			[180983] = true,	--	BG	Artisan's Stuffed Satchel
			[180981] = true,	--	BG	Novice's Large Satchel
			[180980] = true,	--	OW	Journeyman's Large Satchel
			[180979] = true,	--	BG	Artisan's Large Satchel
			[180977] = true,	--	BG	Spirit-Tender's Satchel
			[180976] = true,	--	OW	Artisan's Satchel
			[180975] = true,	--	BG	Journeyman's Satchel
			[180974] = true,	--	OW	Novice's Satchel
			[180875] = true,	--	BG	Carriage Cargo
			[180649] = true,	--	OW	Wild Hunt Supplies
			[180648] = true,	--	OW	Court of Harvesters Supplies
			[180647] = true,	--	OW	Ascended Supplies
			[180646] = true,	--	OW	Supplies of the Undying Army
		--	[180592] = false,	--	OW	Trapped Stonefiend							Not A Cache, its a Pet - Use New Openables Addon
		--	[180533] = false,	--	LP	Solenium Lockbox
		--	[180532] = false,	--	LP	Oxxein Lockbox
		--	[180522] = false,	--	LP	Phaedrum Lockbox
			[180442] = true,	--	BG	Bag of Sin Stones
			[180386] = true,	--	BG	Herbalist's Pouch
		--	[180380] = false,	--	BG	Lace Draperies								Requires Shadowlands Tailoring 100 - Use New Openables Addon
		--	[180379] = false,	--	BG	Exquisitely Woven Rug						Requires Shadowlands Tailoring  75 - Use New Openables Addon
			[180378] = true,	--	BG	Forgemaster's Crate
			[180355] = true,	--	OW	Ornate Pyx
			[180128] = true,	--	BG	Harvester's Elite Bounty Purse
			[180085] = true,	--		Kyrian Keepsake
			[179380] = true,	--	BG	Redelev Purse
		--	[179311] = false,	--	LP	Oxxein Lockbox
			[178969] = true,	--	BG	Test Container
			[178968] = true,	--	BG	Weekly Gardener's Satchel
			[178967] = true,	--	BG	Large Gardener's Satchel
			[178966] = true,	--	BG	Gardener's Satchel
			[178965] = true,	--	BG	Small Gardener's Satchel
			[178529] = true,	--		Pouch of Shinies
			[178528] = true,	--		Pouch of Shinies
			[178128] = true,	--		Pouch of Shinies
			[178078] = true,	--	BG	Reborn Spirit Cache
			[178040] = true,	--	OW	Condensed Stygia
			[175135] = true,	--	BG	Atticus's Spare Supplies
			[175095] = true,	--	BG	Book of Tickets

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen09:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen09:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen09:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen09:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen09:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen09:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen09:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen09:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen09:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen09:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < 1.5 then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			local info = C_Container.GetContainerItemInfo(bag, slot)
			local canOpen = info and info.hasLoot and not info.isLocked
			if id and autoOpenItems09[id] and canOpen then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F09 " .. C_Container.GetContainerItemLink(bag, slot))
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
