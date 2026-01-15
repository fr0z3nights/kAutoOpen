local kAutoOpen07 = CreateFrame('Frame')

kAutoOpen07:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	07	WORLD OF WARCRAFT:	LEGION
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems07 = {

			--	Legion Remix
			[256763] = true,	--	Cache from the Infinite's Armory					Heistd	251010			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[251821] = true,	--	Cache of Infinitre Power							Heistd	251010			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[248247] = true,	--	Cache of Infinitre Power							Heistd	251010			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[246815] = true,	--	Lesser Bronze Cache									Heistd	251010			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[246814] = true,	--	Bronze Cache										Looted	251009
			[246813] = true,	--	Greater Bronze Cache								Heistd	251016			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[246812] = true,	--	Minor Bronze Cache									Looted	251009
			[245553] = true,	--	Heroic Cache of Infinite Treasure					Heistd	251010			Thanks LeeZan	https://wago.io/k_RrLeFX0/12
			[243373] = true,	--	Timerunner's Weaponry								Looted	251008
			[237812] = true,	--	Cache of Infinite Treasure							Looted	251008
			--	Legion
			[165851] = true,	--	BG		Bag of Anchors
			[165839] = true,	--	BG		Unopened Gnomeregan Supply Box
			[165732] = true,	--	BG		Cache of Dazar'alor Treasures
			[165731] = true,	--	BG		Cache of Dazar'alor Treasures
			[165730] = true,	--	BG		Cache of Dazar'alor Treasures
			[165729] = true,	--	BG		Cache of Dazar'alor Treasures
			[165718] = true,	--	BG		Steel Strongbox
			[165717] = true,	--	BG		Steel Strongbox
			[165716] = true,	--	BG		Bronze Strongbox
			[165715] = true,	--	BG		Silver Strongbox
			[165714] = true,	--	BG		Gold Strongbox
			[165713] = true,	--	BG		Bronze Strongbox
			[165712] = true,	--	BG		Silver Strongbox
			[165711] = true,	--			Gold Strongbox
			[164940] = true,	--	BG		Mysterious Satchel
			[164939] = true,	--	BG		Overstuffed Silkweave Purse
			[164938] = true,	--	BG		G.G. Gearbox
			[164931] = true,	--	BG		Rumbler's Purse
			[164627] = true,	--	BG		Crate of Highmountain Tauren Archaeology Fragments
			[164626] = true,	--	BG		Crate of Highborne Archaeology Fragments
			[164625] = true,	--	BG		Crate of Demon Archaeology Fragments
			[164264] = true,	--	BG		Steel Strongbox
			[164263] = true,	--	BG		Steel Strongbox
			[164262] = true,	--	BG		Steel Strongbox
			[164261] = true,	--	BG		Steel Strongbox
			[164260] = true,	--	BG		Cache of Uldir Treasures
			[164259] = true,	--	BG		Cache of Uldir Treasures
			[164258] = true,	--	BG		Cache of Uldir Treasures
			[164257] = true,	--	BG		Cache of Uldir Treasures
			[164254] = true,	--	BG		Steel Strongbox
			[164253] = true,	--	BG		Steel Strongbox
			[164252] = true,	--	BG		Champion's Strongbox
			[164251] = true,	--	BG		Champion's Strongbox
			[163826] = true,	--	BG		Raider's Supply Cache
			[163825] = true,	--	BG		Plundered Supplies
			[163734] = true,	--	BG		Bulging Coin Purse
			[163633] = true,	--			Captain Gulnaku's Treasure
			[163613] = true,	--			Sack of Plunder
			[163612] = true,	--			Wayfinder's Satchel
			[163611] = true,	--			Seafarer's Coin Pouch
			[163148] = true,	--	BG		Luxurious Hat Box
			[163146] = true,	--	BG		Fancy Hat Box
			[163144] = true,	--	BG		Striped Hat Box
			[163142] = true,	--	BG		Ironbound Hat Box
			[163141] = true,	--	BG		Spooky Hat Box
			[163139] = true,	--	BG		Carefully Wrapped Hat Box
			[163059] = true,	--	BG		Spoils of Jani
			[161878] = true,	--			Tiny Coin Purse
			[161084] = true,	--	BG		Recovered Stormsong Produce
			[161083] = true,	--			Satchel of Plundered Jewels
			[160831] = true,	--	BG		Cracking Cobra Egg
			[160578] = true,	--			Anglin' Art's Bag o' Fish
			[160514] = true,	--	BG		Maokka's Box
			[160485] = true,	--	BG		An Unforgettable Luncheon
			[160439] = true,	--	BG		Adventurer's Footlocker
			[160324] = true,	--	BG		Grumbling Sac
			[160322] = true,	--	BG		Pile of Ore
			[160268] = true,	--	BG		Bag of Armor (DNT)
			[160054] = true,	--	BG		War-Torn Satchel of Cooperation
			[159783] = true,	--			Kane's Coin Purse
		--	[157825] = false,	--	LP		Faronis Lockbox
		--	[157822] = false,	--	LP		Dreamweaver Lockbox
			[156836] = true,	--	BG		Bulging Package
			[156707] = true,	--	BG		Bret's Satchel of Helpful Goods
			[156698] = true,	--	BG		Tranquil Satchel of Helpful Goods
			
			[156688] = true,	--	BG		Icy Satchel of Helpful Goods
			[156683] = true,	--	BG		Satchel of Helpful Goods
			[156682] = true,	--	BG		Otherworldly Satchel of Helpful Goods
			[154992] = true,	--	BG		Brawler's Footlocker
			[154991] = true,	--	BG		Brawler's Footlocker
			[153574] = true,	--	BG		Plain Hat Box
			[153504] = true,	--	BG		Cache of Antoran Treasures
			[153503] = true,	--	BG		Cache of Antoran Treasures
			[153502] = true,	--	BG		Cache of Antoran Treasures
			[153501] = true,	--	BG		Cache of Antoran Treasures
			[153248] = true,	--			Light's Fortune
			[153202] = true,	--			Argunite Cluster
			[153191] = true,	--	BG		Cracked Fel-Spotted Egg
			[153132] = true,	--	BG		Coffer of Argus Equipment
			[153122] = true,	--	BG		Wyrmtongue Cache of Magic
			[153121] = true,	--	BG		Wyrmtongue Cache of Skins
			[153120] = true,	--	BG		Wyrmtongue Cache of Minerals
			[153119] = true,	--	BG		Wyrmtongue Cache of Finery
			[153118] = true,	--	BG		Wyrmtongue Cache of Shiny Things
			[153117] = true,	--	BG		Wyrmtongue Cache of Supplies
			[153116] = true,	--	BG		Wyrmtongue Cache of Herbs
		--	[152922] = true,	--	250606	Brittle Krokul Chest					Doesn't Open :| Use New Openables Linked in Changelog
			[152868] = true,	--			Anglin' Art's Mudfish Bait
			[152582] = true,	--	BG		Stack of Skins
			[152581] = true,	--	BG		Bag of Jewels
			[152580] = true,	--	BG		Pile of Cloth
			[152578] = true,	--	BG		Sack of Herbs
		--	[152108] = false,	--	NO		Legionfall Chest						Doesn't Openm :( Use New Openables Linked in Changelog				
		--	[152106] = true,	--	NO		Valarjar Strongbox						Doesn't Openm :( Use New Openables Linked in Changelog				
		--	[152103] = true,	--	NO		Dreamweaver Cache						Doesn't Openm :( Use New Openables Linked in Changelog				
			[151638] = true,	--	BG		Leprous Sack of Pet Supplies
			[151558] = true,	--	BG		Champion's Strongbox
			[151557] = true,	--	BG		Champion's Strongbox
			[151554] = true,	--	BG		Time-Lost Keepsake Box
			[151553] = true,	--	BG		Time-Lost Keepsake Box
			[151552] = true,	--	BG		Time-Lost Keepsake Box
			[151551] = true,	--	BG		Time-Lost Keepsake Box
			[151550] = true,	--	BG		Time-Lost Keepsake Box
			[151482] = true,	--	BG		Time-Lost Wallet
			[151264] = true,	--	BG		Clunky Brawler's Purse
			[151238] = true,	--	BG		Dark Brawler's Purse
			[151235] = true,	--	BG		Filthy Brawler's Purse
			[151233] = true,	--	BG		Blingin' Brawler's Bag
			[151232] = true,	--	BG		Brawler's Package
			[151231] = true,	--	BG		Brawler's Egg
			[151230] = true,	--	BG		Croc-Skin Brawler's Purse
			[151229] = true,	--	BG		Brawler's Music Box
			[151225] = true,	--	BG		Wet Brawler's Purse
			[151224] = true,	--	BG		Bitten Brawler's Purse
			[151223] = true,	--	BG		Booming Brawler's Purse
			[151222] = true,	--	BG		Leather Brawler's Purse
			[151221] = true,	--	BG		Gooey Brawler's Purse
			[151060] = true,	--	BG		Keystone Container
			[150924] = true,	--	BG		Greater Tribute of the Broken Isles
			[149753] = true,	--	BG		Knapsack of Chilled Goods
			[147905] = true,	--	BG		Chest of Champion Equipment
			[147521] = true,	--	BG		Cache of Fel Treasures
			[147520] = true,	--	BG		Cache of Fel Treasures
			[147519] = true,	--	BG		Cache of Fel Treasures
			[147518] = true,	--	BG		Cache of Fel Treasures
			[147432] = true,	--	BG		Champion Equipment
			[146948] = true,	--	BG		Tribute of the Broken Isles
			[146801] = true,	--	BG		BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[146800] = true,	--	BG		BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[146799] = true,	--	BG		BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[147446] = true,	--	BG		Brawler's Footlocker
			[146317] = true,	--			Mr. Smite's Supplies
			[144379] = true,	--	BG		Murderous Brawler's Purse
			[144378] = true,	--	BG		Gorestained Brawler's Purse
			[144377] = true,	--	BG		Beginning Brawler's Purse
			[144376] = true,	--	BG		Agile Brawler's Purse
			[144375] = true,	--	BG		Feathered Brawler's Purse
			[144374] = true,	--	BG		Groovy Brawler's Purse
			[144373] = true,	--	BG		Claw-Marked Brawler's Purse
			[144345] = true,	--	BG		Pile of Pet Goodies
			[144330] = true,	--	BG		Sprocket Container
			[144291] = true,	--	BG		Tadpole Gift
			[143948] = true,	--	BG		Chilled Satchel of Vegetables
		--	[143753] = false,	--	NO		Damp Pet Supplies
			[143607] = true,	--	BG		Soldier's Footlocker
			[143606] = true,	--	BG		Satchel of Battlefield Spoils
			[142381] = true,	--	BG		Oath of Fealty
			[142350] = true,	--	BG		Challenger's Purse
			[142342] = true,	--	BG		Glittering Pack
			[142115] = true,	--	BG		Crate of Ogre Archaeology Fragments
			[142114] = true,	--	BG		Crate of Draenor Clans Archaeology Fragments
			[142113] = true,	--	BG		Crate of Arakkoa Archaeology Fragments
			[142023] = true,	--	BG		Adventurer's Footlocker
			[141995] = true,	--	BG		Unclaimed Black Market Container
			[141350] = true,	--	BG		Kirin Tor Chest
			[141344] = true,	--	BG		Tribute of the Broken Isles
			[141184] = true,	--	BG		Violet Hold Contraband Locker
			[141183] = true,	--	BG		Bag of Confiscated Materials
			[141182] = true,	--	BG		Unmarked Suramar Vault Crate
			[141181] = true,	--	BG		Cache of the Black Dragon
			[141180] = true,	--	BG		Seaweed-Encrusted Satchel
			[141179] = true,	--	BG		Watertight Salvage Bag
			[141178] = true,	--	BG		Despoiled Keeper's Cache
			[141177] = true,	--	BG		Nightborne Rucksack
			[141176] = true,	--	BG		Haunted Ravencrest Keepsake
			[141175] = true,	--	BG		Challenger's Spoils
			[141174] = true,	--	BG		Violet Hold Contraband Locker
			[141173] = true,	--	BG		Bag of Confiscated Materials
			[141172] = true,	--	BG		Unmarked Suramar Vault Crate
			[141171] = true,	--	BG		Cache of the Black Dragon
			[141170] = true,	--	BG		Seaweed-Encrusted Satchel
			[141169] = true,	--	BG		Watertight Salvage Bag
			[141168] = true,	--	BG		Despoiled Keeper's Cache
			[141167] = true,	--	BG		Nightborne Rucksack
			[141166] = true,	--	BG		Haunted Ravencrest Keepsake
			[141165] = true,	--	BG		Challenger's Spoils
			[141164] = true,	--	BG		Violet Hold Contraband Locker
			[141163] = true,	--	BG		Bag of Confiscated Materials
			[141162] = true,	--	BG		Unmarked Suramar Vault Crate
			[141161] = true,	--	BG		Cache of the Black Dragon
			[141160] = true,	--	BG		Seaweed-Encrusted Satchel
			[141159] = true,	--	BG		Watertight Salvage Bag
			[141158] = true,	--	BG		Despoiled Keeper's Cache
			[141157] = true,	--	BG		Nightborne Rucksack
			[141156] = true,	--	BG		Haunted Ravencrest Keepsake
			[141155] = true,	--	BG		Challenger's Spoils
			[141069] = true,	--	BG		Skyhold Chest of Riches
			[140998] = true,	--	BG		Horde Strongbox
			[140997] = true,	--	BG		Alliance Strongbox
			[140601] = true,	--	BG		Sixtrigger Resource Crate
			[140591] = true,	--	BG		Shattered Satchel of Cooperation
			[140227] = true,	--			Mr. Smite's Supplies
			[140226] = true,	--			Mana-Tinged Pack
			[140225] = true,	--			Salvaged Armor
			[140224] = true,	--			Mr. Smite's Supplies
			[140222] = true,	--			Harvested Goods
			[140221] = true,	--			Found Sack of Gems
			[140220] = true,	--			Scavenged Cloth
			[140200] = true,	--	BG		Immaculate Nightshard Curio
			[140154] = true,	--	BG		Cache of Nightborne Treasures
			[140152] = true,	--	BG		Cache of Nightborne Treasures
			[140150] = true,	--	BG		Cache of Nightborne Treasures
			[140148] = true,	--	BG		Cache of Nightborne Treasures
			[139879] = true,	--	BG		Crate of Champion Equipment
			[139777] = true,	--	BG		Strange Crate
			[139771] = true,	--	BG		Seething Essence
			[139487] = true,	--	BG		Cache of Nightmarish Treasures
			[139486] = true,	--	BG		Cache of Nightmarish Treasures
			[139488] = true,	--	BG		Cache of Nightmarish Treasures
			[139484] = true,	--	BG		Cache of Nightmarish Treasures
			[139467] = true,	--	BG		Satchel of Spoils
			[139416] = true,	--	BG		Bloated Sewersucker
			[139383] = true,	--	BG		Keystone Container
			[139382] = true,	--	BG		Keystone Container
			[139381] = true,	--	BG		Keystone Container
			[139137] = true,	--	BG		Hag's Belongings
			[139049] = true,	--			Large Legion Chest
			[139048] = true,	--			Small Legion Chest
			[138476] = true,	--	BG		Bronze Strongbox
			[138475] = true,	--	BG		Silver Strongbox
			[138474] = true,	--	BG		Champion's Strongbox
			[138473] = true,	--	BG		Steel Strongbox
			[138472] = true,	--	BG		Steel Strongbox
			[138471] = true,	--	BG		Bronze Strongbox
			[138470] = true,	--	BG		Silver Strongbox
			[138469] = true,	--	BG		Champion's Strongbox
			[138098] = true,	--	BG		Iron-Bound Crate of Battlefield Goods
			[137608] = true,	--	BG		Growling Sac
			[137600] = true,	--	BG		Pile of Pants
			[137594] = true,	--	BG		Pile of Gems
			[137593] = true,	--	BG		Pile of Herbs
			[137592] = true,	--	BG		Pile of Ore
			[137591] = true,	--	BG		Pile of Skins
			[137590] = true,	--	BG		Pile of Silk
			[137565] = true,	--	BG		Warden's Field Kit
			[137564] = true,	--	BG		Nightfallen Hoard
			[137563] = true,	--	BG		Farondis Lockbox
			[137562] = true,	--	BG		Valarjar Cache
			[137561] = true,	--	BG		Highmountain Tribute
			[137560] = true,	--	BG		Dreamweaver Provisions
			[137414] = true,	--	BG		Pet Tournament Purse

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen07:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen07:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen07:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen07:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen07:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen07:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen07:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen07:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen07:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen07:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	
	for bag = 0, 4 do
		for slot = 0, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems07[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F07 " .. C_Container.GetContainerItemLink(bag, slot))
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
