local kAutoOpen05 = CreateFrame('Frame')

kAutoOpen05:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	05	WORLD OF WARCRAFT:	MISTS OF PANDARIA
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems05 = {

			[106130] = true,	--		Big Bag of Herbs
			[105751] = true,	--		Kor'kron Shaman's Treasure
			[105714] = true,	--		Coalesced Turmoil
			[105713] = true,	--		Twisted Treasures of the Vale
			[104296] = true,	--		Ordon Ceremonial Robes
			[104292] = true,	--		Partially-Digested Meal
			[104275] = true,	--		Twisted Treasures of the Vale
			[104273] = true,	--		Flame-Scarred Cache of Offerings
			[104272] = true,	--		Celestial Treasure Box
			[104271] = true,	--		Coalesced Turmoil
			[104268] = true,	--		Pristine Stalker Hide
			[104263] = true,	--		Glinting Pile of Stone
			[104261] = true,	--		Glowing Blue Ash
			[104260] = true,	--		Satchel of Savage Mysteries
			[104258] = true,	--		Glowing Green Ash
			[104198] = true,	--		Mantid Artifact Hunter's Kit
			[104114] = true,	--		Curious Ticking Parcel
			[104112] = true,	--		Curious Ticking Parcel
			[104035] = true,	--		Giant Purse of Timeless Coins
			[104034] = true,	--		Purse of Timeless Coins
			[103632] = true,	--		Lucky Box of Greatness
			[103624] = true,	--		Treasures of the Vale
			[103535] = true,	--	BG	Bulging Bag of Charms (China)
			[102137] = true,	--		Unclaimed Black Market Container
			[ 98562] = true,	--		Sunreaver Bounty
			[ 98560] = true,	--		Arcane Trove
			[ 98133] = true,	--		Greater Cache of Treasures
			[ 98103] = true,	--		Gigantic Sack of Coins
			[ 98102] = true,	--		Overflowing Sack of Coins
			[ 98101] = true,	--		Enormous Sack of Coins
			[ 98100] = true,	--		Humongous Sack of Coins
			[ 98099] = true,	--		Giant Sack of Coins
			[ 98098] = true,	--		Bulging Sack of Coins
			[ 98097] = true,	--		Huge Sack of Coins
			[ 98096] = true,	--		Large Sack of Coins
			[ 98095] = true,	--	BG	Brawler's Pet Supplies
			[ 97957] = true,	--		Surplus Supplies
			[ 97956] = true,	--		Surplus Supplies
			[ 97955] = true,	--		Surplus Supplies
			[ 97954] = true,	--		Surplus Supplies
			[ 97953] = true,	--		Surplus Supplies
			[ 97952] = true,	--		Surplus Supplies
			[ 97951] = true,	--		Surplus Supplies
			[ 97950] = true,	--		Surplus Supplies
			[ 97949] = true,	--		Surplus Supplies
			[ 97948] = true,	--		Surplus Supplies
			[ 97565] = true,	--		Unclaimed Black Market Container
			[ 97153] = true,	--		Spoils of the Thunder King
			[ 95619] = true,	--		Amber Encased Treasure Pouch
			[ 95618] = true,	--		Cache of Mogu Riches
			[ 95617] = true,	--		Dividends of the Everlasting Spring
			[ 95602] = true,	--		Stormtouched Cache
			[ 95601] = true,	--		Shiny Pile of Refuse
			[ 95469] = true,	--		Serpent's Heart
			[ 95343] = true,	--		Treasures of the Thunder King
			[ 94566] = true,	--		Fortuitous Coffer
			[ 94553] = true,	--		Notes on Lightning Steel
			[ 94296] = true,	--		Cracked Primal Egg
			[ 94220] = true,	--		Sunreaver Bounty
			[ 94219] = true,	--		Arcane Trove
			[ 94207] = true,	--	BG	Fabled Pandaren Pet Supplies
			[ 94159] = true,	--		Small Bag of Zandalari Supplies
			[ 94158] = true,	--		Big Bag of Zandalari Supplies
			[ 93724] = true,	--		Darkmoon Game Prize
			[ 93360] = true,	--		Serpent's Cache
			[ 93200] = true,	--		Tome of the Serpent
			[ 93199] = true,	--		Tome of the Crane
			[ 93198] = true,	--		Tome of the Tiger
			[ 93149] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 93148] = true,	--		Pet Supplies
			[ 93147] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 93146] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 92960] = true,	--		Silkworm Cocoon
			[ 92813] = true,	--		Greater Cache of Treasures
			[ 92794] = true,	--		Ride Ticket Book
			[ 92793] = true,	--		Ride Ticket Book
			[ 92792] = true,	--		Ride Ticket Book
			[ 92791] = true,	--		Ride Ticket Book
			[ 92790] = true,	--		Ride Ticket Book
			[ 92789] = true,	--		Ride Ticket Book
			[ 92788] = true,	--		Ride Ticket Book
			[ 92744] = true,	--		Heavy Sack of Gold
			[ 92718] = true,	--		Brawler's Purse
			[ 90840] = true,	--		Marauder's Gleaming Sack of Gold
			[ 90839] = true,	--		Cache of Sha-Touched Gold
			[ 90818] = true,	--		Misty Satchel of Exotic Mysteries
			[ 90735] = true,	--		Goodies from Nomi
			[ 90635] = true,	--		Hero's Purse
			[ 90634] = true,	--		Hero's Purse
			[ 90633] = true,	--		Hero's Purse
			[ 90632] = true,	--		Hero's Purse
			[ 90631] = true,	--		Hero's Purse
			[ 90630] = true,	--		Hero's Purse
			[ 90629] = true,	--		Hero's Purse
			[ 90628] = true,	--		Hero's Purse
			[ 90627] = true,	--		Hero's Purse
			[ 90626] = true,	--		Hero's Purse
			[ 90625] = true,	--		Treasures of the Vale
			[ 90624] = true,	--		Hero's Purse
			[ 90623] = true,	--		Hero's Purse
			[ 90622] = true,	--		Hero's Purse
			[ 90621] = true,	--		Hero's Purse
			[ 90537] = true,	--		Winner's Reward
			[ 90406] = true,	--		Facets of Research
			[ 90401] = true,	--		Facets of Research
			[ 90400] = true,	--		Facets of Research
			[ 90399] = true,	--		Facets of Research
			[ 90398] = true,	--		Facets of Research
			[ 90397] = true,	--		Facets of Research
			[ 90395] = true,	--		Facets of Research
			[ 90165] = true,	--		Golden Chest of the Lich Lord
			[ 90164] = true,	--		Golden Chest of the Cycle
			[ 90163] = true,	--		Golden Chest of the Howling Beast
			[ 90162] = true,	--		Golden Chest of the Regal Lord
			[ 90161] = true,	--		Golden Chest of the Holy Warrior
			[ 90160] = true,	--		Golden Chest of the Light
			[ 90159] = true,	--		Golden Chest of the Silent Assassin
			[ 90158] = true,	--		Golden Chest of the Elemental Triad
			[ 90157] = true,	--		Golden Chest of Windfury
			[ 90156] = true,	--		Golden Chest of the Betrayer
			[ 90155] = true,	--		Golden Chest of the Golden King
			[ 90041] = true,	--		Spoils of Theramore
			[ 89991] = true,	--		Pandaria Fireworks
			[ 89858] = true,	--		Cache of Mogu Riches
			[ 89857] = true,	--		Dividends of the Everlasting Spring
			[ 89856] = true,	--		Amber Encased Treasure Pouch
			[ 89810] = true,	--		Bounty of a Sundered Land
			[ 89808] = true,	--		Dividends of the Everlasting Spring
			[ 89807] = true,	--		Amber Encased Treasure Pouch
			[ 89804] = true,	--		Cache of Mogu Riches
			[ 89613] = true,	--		Cache of Treasures
			[ 89610] = true,	--		Pandaria Herbs
			[ 89609] = true,	--		Crate of Dust
			[ 89608] = true,	--		Crate of Ore
			[ 89607] = true,	--		Crate of Leather
			[ 89428] = true,	--		Ancient Mogu Treasure
			[ 89427] = true,	--		Ancient Mogu Treasure
			[ 89125] = true,	--		Sack of Pet Supplies
		--	[ 88567] = false,	--	LP	Ghost Iron Lockbox
			[ 88496] = true,	--		Sealed Crate
		--	[ 88165] = false,	--	LP	Vine-Cracked Junkbox
			[ 87730] = true,	--		Sack of Crocolisk Belly
			[ 87729] = true,	--		Sack of Golden Carp
			[ 87728] = true,	--		Sack of Krasarang Paddlefish
			[ 87727] = true,	--		Sack of Reef Octopus
			[ 87726] = true,	--		Sack of Jewel Danio
			[ 87725] = true,	--		Sack of Tiger Gourami
			[ 87724] = true,	--		Sack of Redbelly Mandarin
			[ 87723] = true,	--		Sack of Emperor Salmon
			[ 87722] = true,	--		Sack of Giant Mantis Shrimp
			[ 87721] = true,	--		Sack of Jade Lungfish
			[ 87716] = true,	--		Sack of White Turnips
			[ 87715] = true,	--		Sack of Pink Turnips
			[ 87714] = true,	--		Sack of Striped Melons
			[ 87713] = true,	--		Sack of Jade Squash
			[ 87712] = true,	--		Sack of Witchberries
			[ 87710] = true,	--		Sack of Red Blossom Leeks
			[ 87709] = true,	--		Sack of Scallions
			[ 87708] = true,	--		Sack of Mogu Pumpkins
			[ 87707] = true,	--		Sack of Juicycrunch Carrots
			[ 87706] = true,	--		Sack of Green Cabbages
			[ 87705] = true,	--		Sack of Wildfowl Breasts
			[ 87704] = true,	--		Sack of Raw Crab Meat
			[ 87703] = true,	--		Sack of Raw Turtle Meat
			[ 87702] = true,	--		Sack of Mushan Ribs
			[ 87701] = true,	--		Sack of Raw Tiger Steaks
			[ 87541] = true,	--		Crate of Vrykul Archaeology Fragments
			[ 87540] = true,	--		Crate of Troll Archaeology Fragments
			[ 87539] = true,	--		Crate of Tol'vir Archaeology Fragments
			[ 87538] = true,	--		Crate of Orc Archaeology Fragments
			[ 87537] = true,	--		Crate of Nerubian Archaeology Fragments
			[ 87536] = true,	--		Crate of Night Elf Archaeology Fragments
			[ 87535] = true,	--		Crate of Fossil Archaeology Fragments
			[ 87534] = true,	--		Crate of Draenei Archaeology Fragments
			[ 87533] = true,	--		Crate of Dwarven Archaeology Fragments
			[ 87391] = true,	--		Plundered Treasure
			[ 87225] = true,	--		Big Bag of Food
			[ 87224] = true,	--		Big Bag of Wonders
			[ 87223] = true,	--		Big Bag of Skins
			[ 87222] = true,	--		Big Bag of Linens
			[ 87221] = true,	--		Big Bag of Jewels
			[ 87220] = true,	--		Big Bag of Mysteries
			[ 87219] = true,	--		Huge Bag of Herbs
			[ 87218] = true,	--		Big Bag of Arms
			[ 87217] = true,	--		Small Bag of Goods
			[ 86623] = true,	--		Blingtron 004000 Gift Package
			[ 86595] = true,	--		Bag of Helpful Things
			[ 86428] = true,	--		Old Man Thistle's Treasure
			[ 85498] = true,	--		Songbell Seed Pack
			[ 85497] = true,	--		Chirping Package
			[ 85277] = true,	--		Nicely Packed Lunch
			[ 85276] = true,	--		Celebration Gift
			[ 85275] = true,	--		Chee Chee's Goodie Bag
			[ 85274] = true,	--		Gro-Pack
			[ 85272] = true,	--		Tree Seed Pack
			[ 85271] = true,	--		Secret Stash
			[ 85227] = true,	--		Special Seed Pack
			[ 85226] = true,	--		Basic Seed Pack
			[ 85225] = true,	--		Basic Seed Pack
			[ 85224] = true,	--		Basic Seed Pack
			[ 85223] = true,	--		Enigma Seed Pack
			[ 78930] = true,	--		Sealed Crate
			[ 77956] = true,	--		Spectral Mount Crate
			[ 77501] = true,	--		Blue Blizzcon Bag
			[ 72201] = true,	--		Plump Intestines

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen05:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen05:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen05:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen05:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen05:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen05:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen05:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen05:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen05:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen05:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems05[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F05 " .. C_Container.GetContainerItemLink(bag, slot))
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
