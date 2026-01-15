local kAutoOpen08 = CreateFrame('Frame')

kAutoOpen08:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	08	WORLD OF WARCRAFT:	BATTLE FOR AZEROTH
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItems08 = {

			[174961] = true,	--		Uldum Assault Cache
			[174960] = true,	--		Uldum Assault Cache
			[174959] = true,	--		Pandaria Assault Cache
			[174958] = true,	--		Pandaria Assault Cache
			[174652] = true,	--	BG	Satchel of Forgotten Heirlooms
			[174642] = true,	--	BG	Corrupted Ny'alotha Raid Item
			[174529] = true,	--	BG	Crate of Coalescing Visions
			[174484] = true,	--	BG	Uldum Accord Supplies
			[174483] = true,	--	BG	Rajani Supplies
			[174358] = true,	--	BG	Unopened Blackrock Supply Crate
			[174195] = true,	--	BG	Bag of Gems
			[174194] = true,	--	BG	Bag of Enchanting
			[174184] = true,	--	BG	Bag of Cloth
			[174183] = true,	--	BG	Bag of Leather
			[174182] = true,	--	BG	Bag of Ore
			[174181] = true,	--	BG	Bag of Herbs
			[174039] = true,	--	BG	Crate of Cursed Mementos
			[173997] = true,	--	BG	Whispering Reef Salvage
			[173996] = true,	--	BG	Verdant Wilds Salvage
			[173995] = true,	--	BG	Venture Co. 'Salvage'
			[173994] = true,	--	BG	Un'gol Ruins Salvage
			[173993] = true,	--	BG	Snowblossom Salvage
			[173992] = true,	--	BG	Skittering Hollow Salvage
			[173991] = true,	--	BG	Rotting Mire Salvage
			[173990] = true,	--	BG	Molten Cay Salvage
			[173989] = true,	--	BG	Jorundall Salvage
			[173988] = true,	--	BG	Havenswood Salvage
			[173987] = true,	--	BG	Elemental Salvage
			[173983] = true,	--	BG	Vulpera Satchel of Salvage
			[173950] = true,	--	BG	Crestfall Salvage
			[173949] = true,	--	BG	Dread Chain Salvage
			[173734] = true,	--	BG	Mysterious Crate
			[173372] = true,	--		Cache of the Black Empire
			[172021] = true,	--	BG	Marks of Sanctification Purse
			[171305] = true,	--		Sack of Plunder
			[171211] = true,	--		Venthyr's Coin Purse
			[171210] = true,	--	OW	Satchel of Nature's Bounty
			[171209] = true,	--	OW	Blooded Satchel
			[171988] = true,	--	BG	Adventurer's Footlocker
			[170539] = true,	--	BG	Plundered Supplies
		--	[170502] = false,	--	NO	Waterlogged Toolbox
			[170489] = true,	--	BG	Mardivas's Handmade Handbag
			[170473] = true,	--		Jingling Sack
			[170195] = true,	--		Voidcaster's Supply Bag
			[170190] = true,	--	BG	Mardivas' Bag of Containing
			[170188] = true,	--		Barnacled Bag of Goods
			[170185] = true,	--		Intact Naga Skeleton
			[170074] = true,	--	BG	Dented Ashmaul Strongbox Horde
			[170073] = true,	--	BG	Dented Ashmaul Strongbox Alliance
			[170065] = true,	--	BG	Re-Procedurally Generated Punchcard
			[170061] = true,	--		Rustbolt Supplies
			[169940] = true,	--	BG	Unshackled Supplies
			[169939] = true,	--	BG	Ankoan Supplies
			[169922] = true,	--	BG	Vim's Gift of Appreciation
			[169921] = true,	--	BG	Spine Guarded Supplies
			[169920] = true,	--	BG	Neri's Spare Supplies
			[169919] = true,	--	BG	Unshackled Commendation Crate
			[169917] = true,	--	BG	Mysterious Azshari Chest
			[169916] = true,	--	BG	Brew-Soaked Supplies
			[169915] = true,	--	BG	Poen's Stashed Supplies
			[169914] = true,	--	BG	Neri's Smart Supplies
			[169911] = true,	--	BG	Liberated Naga Cache
			[169910] = true,	--	BG	Vim's Scavenged Supplies
			[169909] = true,	--	BG	Poen's Neat Things
			[169908] = true,	--	BG	Cleverly Concealed Supplies
			[169905] = true,	--	BG	Faintly Glowing Supplies
			[169904] = true,	--	BG	Ankoan Commendation Crate
			[169903] = true,	--		Nazjatar Survival Pack
			[169850] = true,	--		Azeroth Mini Pack: Mechagon
			[169848] = true,	--		Azeroth Mini Pack: Bondo's Yard
			[169838] = true,	--		Azeroth Mini Pack: Starter Pack
			[169666] = true,	--		Stratholme Supply Crate
		--	[169475] = false,	--	LP	Barnacled Lockbox
			[169471] = true,	--		Cogrenzy's Construction Toolkit
			[169430] = true,	--	BG	Unclaimed Black Market Container
			[169137] = true,	--	BG	Extraordinary Adventurer Augmentation
			[169133] = true,	--	BG	Crystallized Jelly
			[169113] = true,	--	BG	Advanced Adventurer Augmentation
			[168833] = true,	--	BG	Experimental Adventurer Augmentation
			[168740] = true,	--		Blingtron 7000
			[168488] = true,	--	BG	Seafarer's Lost Coin Pouch
			[168395] = true,	--		Irradiated Box of Assorted Parts
			[168394] = true,	--		Box of Assorted Parts
			[168266] = true,	--	BG	Strange Recycling Requisition
			[168264] = true,	--		Recycling Requisition
			[168263] = true,	--	BG	Mundane Recycling Requisition
			[168204] = true,	--		Small Metal Box
			[168162] = true,	--	BG	Chronal Cache of Cloth
		--	[168124] = true,	--	BG	Cache of War Resources						Character War Resources Transfer
			[168057] = true,	--	BG	Rustbolt Requisitions
			[167696] = true,	--	BG	Build-a-Computer Kit
			[166741] = true,	--	BG	Nomi's Grocery Tote
			[166300] = true,	--		7th Legion Supplies
			[166299] = true,	--		Honorbound Supplies
			[166298] = true,	--		Champions of Azeroth Supplies
			[166297] = true,	--		Order of Embers Supplie
			[166295] = true,	--		Proudmoore Admiralty Supplies
			[166294] = true,	--		Storm's Wake Supplies
			[166292] = true,	--		Zandalari Empire Supplies
			[166290] = true,	--		Voldunai Supplies
			[166282] = true,	--		Talanji's Expedition Supplies
			[166245] = true,	--		Tortollan Seekers Supplies

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpen08:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen08:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen08:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen08:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen08:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen08:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen08:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen08:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen08:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen08:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	if GetTime and (GetTime() - (kAutoOpen_LastOpenTime or 0)) < 1.5 then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems08[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34F08 " .. C_Container.GetContainerItemLink(bag, slot))
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
