local kAutoOpen06 = CreateFrame('Frame')

kAutoOpen06:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	06	WORLD OF WARCRAFT:	WARLORDS OF DRAENOR
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems06 = {

			[136926] = false,	--	OW	Nightmare Pod
			[136383] = true,	--	BG	Ravencrest Cache
			[136362] = true,	--	BG	Ancient War Remnants
			[136359] = true,	--	BG	Shaman's Pouch
			[135546] = true,	--	BG	Fel-Touched Crate of Battlefield Goods
			[135545] = true,	--	BG	Savage Crate of Battlefield Goods
			[135544] = true,	--	BG	Tranquil Crate of Helpful Goods - Reuse Me
			[135543] = true,	--	BG	Rival's Crate of Battlefield Goods
			[135542] = true,	--	BG	Icy Crate of Battlefield Goods
			[135541] = true,	--	BG	Crusader's Crate of Battlefield Goods
			[135540] = true,	--	BG	Crate of Battlefield Goods
			[135539] = true,	--		Crate of Battlefield Goods
			[133804] = true,	--	BG	Rare Bag of Loot
			[133803] = true,	--	BG	Common Bag of Loot
			[133721] = true,	--	BG	Message in a Beer Bottle
			[133549] = true,	--		Muck-Covered Shoes
			[132892] = true,	--		Blingtron 6000
			[130186] = true,	--	BG	Intern Items - BJI
			[129746] = true,	--	BG	Oddly-Shaped Stomach
			[128803] = true,	--	BG	Savage Satchel of Cooperation
			[128670] = true,	--	BG	Savage Gift
			[128391] = true,	--	BG	Iron Fleet Treasure Chest
			[128327] = true,	--	BG	Small Pouch of Coins
			[128319] = true,	--	BG	Void-Shrouded Satchel
			[128216] = true,	--	BG	Dented Ashmaul Strongbox
			[128215] = true,	--	BG	Dented Ashmaul Strongbox
			[128214] = true,	--	BG	Dented Ashmaul Strongbox
			[128213] = true,	--	BG	Dented Ashmaul Strongbox
			[128025] = true,	--	BG	Rattling Iron Cage
			[127995] = true,	--	BG	Unclaimed Black Market Container
			[127855] = true,	--	BG	Iron Fleet Treasure Chest
			[127854] = true,	--	BG	Iron Fleet Treasure Chest
			[127853] = true,	--		Iron Fleet Treasure Chest
			[127831] = true,	--	BG	Challenger's Strongbox
			[127395] = true,	--		Ripened Strange Fruit
			[127148] = true,	--	BG	Silas' Secret Stash
			[126947] = true,	--	BG	Nal'ryssa's Spare Mining Supplies
			[126924] = true,	--	BG	Champion's Strongbox
			[126923] = true,	--	BG	Champion's Strongbox
			[126922] = true,	--	BG	Ashmaul Strongbox
			[126921] = true,	--	BG	Ashmaul Strongbox
			[126920] = true,	--	BG	Champion's Strongbox
			[126919] = true,	--	BG	Champion's Strongbox
			[126918] = true,	--	BG	Ashmaul Strongbox
			[126917] = true,	--	BG	Ashmaul Strongbox
			[126916] = true,	--	BG	Bronze Strongbox
			[126915] = true,	--	BG	Silver Strongbox
			[126914] = true,	--	BG	Gold Strongbox
			[126913] = true,	--	BG	Steel Strongbox
			[126912] = true,	--	BG	Steel Strongbox
			[126911] = true,	--	BG	Bronze Strongbox
			[126910] = true,	--	BG	Silver Strongbox
			[126909] = true,	--	BG	Gold Strongbox
			[126908] = true,	--	BG	Bronze Strongbox
			[126907] = true,	--	BG	Silver Strongbox
			[126906] = true,	--	BG	Gold Strongbox
			[126905] = true,	--	BG	Steel Strongbox
			[126904] = true,	--	BG	Steel Strongbox
			[126903] = true,	--	BG	Bronze Strongbox
			[126902] = true,	--	BG	Silver Strongbox
			[126901] = true,	--	BG	Gold Strongbox
			[124054] = true,	--	BG	Time-Twisted Anomaly
			[123975] = true,	--		Greater Bounty Spoils
			[123963] = true,	--	BG	Recipe List: Masterwork Demonsteel
			[123962] = true,	--	BG	Recipe List: Hardened Leystone
			[123961] = true,	--	BG	Recipe List: Leysmithing
			[123858] = true,	--		Follower Retraining Scroll Case
			[123857] = true,	--		Runic Pouch
			[122718] = true,	--		Clinking Present
			[122613] = true,	--		Stash of Dusty Music Rolls
			[122607] = true,	--		Savage Satchel of Cooperation
			[122486] = true,	--		Blackrock Foundry Spoils
			[122485] = true,	--		Blackrock Foundry Spoils
			[122484] = true,	--		Blackrock Foundry Spoils
			[122483] = true,	--		Scouting Report: Nagrand
			[122482] = true,	--		Scouting Report: Spires of Arak
			[122481] = true,	--		Scouting Report: Talador
			[122480] = true,	--		Scouting Report: Gorgrond
			[122479] = true,	--		Scouting Report: Shadowmoon Valley
			[122478] = true,	--		Scouting Report: Frostfire Ridge
			[122242] = true,	--		Relic Acquisition Compensatory Package
			[122191] = true,	--		Bloody Stack of Invitations
			[122163] = true,	--		Routed Invader's Crate of Spoils
		--	[121331] = false,	--	LP	Leystone Lockbox
			[120356] = true,	--		Bronze Strongbox
			[120355] = true,	--		Silver Strongbox
			[120354] = true,	--		Gold Strongbox
			[120353] = true,	--		Steel Strongbox
			[120334] = true,	--		Satchel of Cosmic Mysteries
			[120325] = true,	--		Overflowing Stacked Card Deck
			[120324] = true,	--		Bursting Stacked Card Deck
			[120323] = true,	--		Bulging Stacked Card Deck
			[120322] = true,	--		Klinking Stacked Card Deck
			[120320] = true,	--		Invader's Abandoned Sack
			[120319] = true,	--		Invader's Damaged Cache
			[120312] = true,	--		Bulging Sack of Coins
			[120184] = true,	--		Ashmaul Strongbox
			[120170] = true,	--		Partially-Digested Bag
			[120151] = true,	--		Gleaming Ashmaul Strongbox
			[120147] = true,	--		Bloody Gold Purse
			[120146] = true,	--		Smuggled Sack of Gold
			[120142] = true,	--		Coliseum Champion's Spoils
			[119330] = true,	--		Steel Strongbox
			[119201] = true,	--		Jewelcrafting Payment
			[119200] = true,	--		Jewelcrafting Payment
			[119199] = true,	--		Jewelcrafting Payment
			[119198] = true,	--		Jewelcrafting Payment
			[119197] = true,	--		Jewelcrafting Payment
			[119196] = true,	--		Jewelcrafting Payment
			[119195] = true,	--		Jewelcrafting Payment
			[119191] = true,	--		Jewelcrafting Payment
			[119190] = true,	--		Unclaimed Payment
			[119189] = true,	--		Unclaimed Payment
			[119188] = true,	--		Unclaimed Payment
			[119043] = true,	--		Trove of Smoldering Treasures
			[119042] = true,	--		Crate of Valuable Treasures
			[119041] = true,	--		Strongbox of Mysterious Treasures
			[119040] = true,	--		Cache of Mingled Treasures
			[119037] = true,	--		Supply of Storied Rarities
			[119036] = true,	--		Box of Storied Treasures
			[119032] = true,	--		Challenger's Strongbox
		--	[119000] = false,	--	LP	Highmaul Lockbox
			[118931] = true,	--		Leonid's Bag of Supplies
			[118930] = true,	--		Bag of Everbloom Herbs
			[118929] = true,	--		Sack of Mined Ore
			[118928] = true,	--		Faintly-Sparkling Cache
			[118927] = true,	--		Maximillian's Laundry
			[118926] = true,	--		Huge Pile of Skins
			[118925] = true,	--		Plundered Booty
			[118924] = true,	--		Cache of Arms
			[118759] = true,	--		Alchemy Experiment
			[118706] = true,	--		Cracked Goren Egg
		--	[118697] = false,	--	NO	Big Bag of Pet Supplies
			[118531] = true,	--		Cache of Highmaul Treasures
			[118530] = true,	--		Cache of Highmaul Treasures
			[118529] = true,	--		Cache of Highmaul Treasures
		--	[118193] = false,	--	LP	Mysterious Shining Lockbox
			[118094] = true,	--		Dented Ashmaul Strongbox
			[118093] = true,	--		Dented Ashmaul Strongbox
			[118066] = true,	--		Ashmaul Strongbox
			[118065] = true,	--		Gleaming Ashmaul Strongbox
			[117414] = true,	--		Stormwind Guard Armor Package
			[117394] = true,	--		Satchel of Chilled Goods
			[117392] = true,	--		Loot-Filled Pumpkin
			[117388] = true,	--		Crate of Mantid Archaeology Fragments
			[117387] = true,	--		Crate of Mogu Archaeology Fragments
			[117386] = true,	--		Crate of Pandaren Archaeology Fragments
			[116980] = true,	--		Invader's Forgotten Treasure
		--	[116920] = false,	--	LP	True Steel Lockbox
			[116764] = true,	--		Small Pouch of Coins
			[116404] = true,	--		Pilgrim's Bounty
			[116376] = true,	--		Small Pouch of Coins
			[116202] = true,	--		Pet Care Package
			[116129] = true,	--		Dessicated Orc's Coin Pouch
			[116111] = true,	--		Small Pouch of Coins
			[114970] = true,	--		Small Pouch of Coins
			[114669] = true,	--		Tranquil Satchel of Helpful Goods
			[114662] = true,	--		Tranquil Satchel of Helpful Goods
			[114655] = true,	--		Scorched Satchel of Helpful Goods
			[114648] = true,	--		Scorched Satchel of Helpful Goods
			[114641] = true,	--		Icy Satchel of Helpful Goods
			[114634] = true,	--		Icy Satchel of Helpful Goods
			[114028] = true,	--		Small Pouch of Coins
			[113258] = true,	--		Blingtron 5000 Gift Package
			[112623] = true,	--		Pack of Fishing Supplies
			[112108] = true,	--		Cracked Egg
			[111600] = true,	--		Bronze Strongbox
			[111599] = true,	--		Silver Strongbox
			[111598] = true,	--		Gold Strongbox
			[110678] = true,	--		Darkmoon Ticket Fanny Pack
			[110592] = true,	--		Unclaimed Black Market Container
			[110278] = true,	--		Engorged Stomach
			[108740] = true,	--		Stolen Weapons
			[108738] = true,	--		Giant Draenor Clam
			[107271] = true,	--		Frozen Envelope
			[107270] = true,	--		Bound Traveler's Scroll
			[107077] = true,	--		Bag of Transformers
		--	[106895] = false,	--	LP	Iron-Bound Junkbox

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen06:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen06:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen06:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen06:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen06:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen06:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen06:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen06:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen06:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen06:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < 1.5 then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems06[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F06 " .. C_Container.GetContainerItemLink(bag, slot))
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
