local kAutoOpenEV = CreateFrame('Frame')

kAutoOpenEV:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
--	XX	WORLD OF WARCRAFT:	EVENTS  44663
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItemsEV = {

	--	Timewalking				Monthly 
			[156689] = true,	--	BG		Scorched Satchel of Helpful Goods
	--	Darkmoon Faire			Monthly 
			[127141] = true,	--	BG	Bloated Thresher								250808		Moved from 06 to EV
			[124670] = true,	--		Sealed Darkmoon Crate							250807		Moved from 06 to EV
			[116062] = true,	--	24	Greater Darkmoon Pet Supplies
			[ 91086] = true,	--	24	Darkmoon Pet Supplies
			[ 78910] = true, 	--		Sack o' Tokens
			[ 78909] = true, 	--		Sack o' Tokens
			[ 78908] = true, 	--		Sack o' Tokens
			[ 78907] = true, 	--		Sack o' Tokens
			[ 78906] = true, 	--		Sack o' Tokens
			[ 78905] = true, 	--		Sack o' Tokens
			[ 78904] = true, 	--		Pouch o' Tokens
			[ 78903] = true, 	--		Pouch o' Tokens
			[ 78902] = true, 	--		Pouch o' Tokens
			[ 78901] = true, 	--		Pouch o' Tokens
			[ 78900] = true, 	--		Pouch o' Tokens
			[ 78899] = true, 	--		Pouch o' Tokens
			[ 78898] = true, 	--		Sack o' Tokens
			[ 78897] = true, 	--		Pouch o' Tokens
	
	--	Trial of Style			Random Event
			[ 44113] = true,	--	BG	Trial of Style Consolation Prize

	--	Trial of Style			Random Event
			[147576] = true,	--	BG	Trial of Style Consolation Prize
			[147575] = true,	--	BG	Trial of Style Reward: Third Place
			[147574] = true,	--	BG	Trial of Style Reward: Second Place
			[147573] = true,	--	BG	Trial of Style Reward: First Place

	--	Lunar Festival			Lunar New Year Event								Older Items in Events Classic
			[ 21746] = true,	--		Lucky Red Envelope

	--	Love is in the Air		Valentines Event									Older Items in Events Classic
		--	Quests & Dailies
			[147907] = true,	--	23	Heart-Shaped Carton		
			[ 54537] = true,	--	23	Heart-Shaped Box
			[ 50161] = true,	--		Dinner Suit Box
			[ 50160] = true,	--		Lovely Dress Box

	--	Noblegarden				Easter Event										Older Items in Events Classic
		--	Quests & Dailies
			[216874] = true,	--	24	Loot-Filled Basket							10 Levels Below Max	60-70
			[213428] = true,	--	24	Loot-Stuffed Basket							Below Above Range	01-59
		--	[ 45072] = true,	--	23	Brightly Colored Egg						Unfortunately No Longer Works, Stupid Blizzard, Use New Openables

	--	Brewfest				Brewfest Event										Older Items in Events Classic
			[117393] = true,	--	23	Keg-Shaped Treasure Chest
			[149752] = true,	--	BG	Keg-Shaped Treasure Box
			[ 54535] = true,	--		Keg-Shaped Treasure Chest

	--	Hallows End				Halloween Event										Older Items in Events Classic
		--	Quests & Dailies
			[209024] = true,	--	24	Loot-Filled Pumpkin
			[149574] = true,	--	BG	Loot-Stuffed Pumpkin
			[ 37586] = true,	--		Handful of Treats

	--	Anniversary				WoW Anniversary Event								
			[235506] = true,	--	24	Box of Timewarped Badges						
			[235505] = true,	--	24	Satchel of Timewarped Badges						
			[232877] = true,	--	24	Timely Goodie Bag							
			[229359] = true,	--	24	Chromie's Goodie Bag
			[229355] = true,	--	24	Chromie's Premium Goodie Bag
			[226102] = true,	--	24	Chromie's Tour Goodie Bag
			[232598] = true,	--	24	Bag of Timewarped Badges
			[208211] = true,	--	23	Anniversary Gift  							19th Anniversary
			[187710] = true,	--	22	Anniversary Gift  							18th Anniversary
			[185906] = true,	--	21	Anniversary Gift  							17th Anniversary
			[178513] = true,	--	20	Anniversary Gift  							16th Anniversary
			[172014] = true,	--	19	Anniversary Gift  							15th Anniversary
			[162637] = true,	--	18	Anniversary Gift  							14th Anniversary
			[147876] = true,	--	17	Anniversary Gift  							13th Anniversary
			[139284] = true,	--	16	Anniversary Gift  							12th Anniversary
			[128513] = true,	--	15	Anniversary Gift  							11th Anniversary
		--	Added to Portal Room section above due to chat window spam on lower level characters, remove -- if you dont mind the spam or dont have lower toons.
		--	[233014] = true,	--	24	Bronze Celebration Cache of Treasures		Cancelled out due to Level 80 Item and Lower Levels Spams Chat
		--	[232471] = true,	--	24	Cache of Dark Iron Treasures				Cancelled out due to Level 80 Item and Lower Levels Spams Chat
	
	--	Winter Veil				Crhistmas Event										Older Items in Events Classic
		--	Quests & Dailies
			[149504] = true,	--	BG	Smokywood Pastures Special Present
			[149503] = true,	--	BG	Stolen Gift
			[116762] = true,  	--		Stolen Present			
			[117395] = true, 	--		Stolen Present			
			[ 93626] = true,  	--		Stolen Present			
			[ 73792] = true,  	--		Stolen Present			
			[ 21315] = true, 	--		Smokywood Satchel
			[ 21216] = true, 	--		Smokywood Pastures Extra-Special Gift
			[ 17727] = true, 	--	23	Smokywood Pastures Gift Pack
			[ 17726] = true, 	--	23	Smokywood Pastures Special Gift
			[ 17685] = true, 	--	22	Smokywood Pastures Sampler
		--	Tree Gifts
			[244908] = true,	--	25	Winter Veil Gift							Looted 251225
			[244906] = true,	--	25	Gently Shaken Gift							Looted 251225
			[218311] = true,	--	24	Winter Veil Gift							Toy - Box of Puntables & Pet - Portentous Present (1/1 NC) [Creepy Crate Recolour?}
			[218309] = true,	--	24	Gently Shaken Gift							Toy - Winter Veil Cracker
			[ 21191] = true,	--	24	Carefully Wrapped Present					Perky Pug 'Merry Munchkin" Costume & Winter Veil Cookies
			[ 21363] = true,	--	24	Festive Gift								Wand of Holiday Cheer
			[ 21310] = true,	--	24	Gaily Wrapped Present						Pet - Winter Veil (Snowman Kit/Jingle Bell/Red Helper Box)
			[ 21327] = true,	--	24	Ticking Present								Mechanical Greench, Preserved Holly
			--	Old Gifts
			[210657] = true,	--	23	Gently Shaken Gift							Toy - Winter Veil Socks
			[209871] = true,	--	23	Winter Veil Gift							Toy - Junior Timekeeper's Racing Belt
			[192094] = true,	--	22	Winter Veil Gift							Toy - Falling Star Catcher
			[192093] = true,	--	22	Gently Shaken Gift							Toy - Falling Star Flinger
			[187561] = true,	--	21	Winter Veil Gift							Toy - Customizer Appearances
			[187520] = true,	--	21	Gently Shaken Gift							Toy - Rockin' Rollin' Racter Customizer 19.9.3
			[178529] = true,	--	20	Gently Shaken Gift							Toy - Wreath-A-Rang
			[178528] = true,	--	20	Winter Veil Gift							Pet - Jingles [Baby Raptor]
			[172225] = true,	--	19	Gently Shaken Gift							Toy - Wild Holly
			[172224] = true,	--	19	Winter Veil Gift							Toy - Crashin' Thrashin' Battleship/Juggernaught Toy
			[162974] = true,	--	18	Gently Shaken Gift							Toy - Greatfateher Winter's Hearthstone
			[162644] = true,	--	18	Winter Veil Gift							Toy - Toy Armor Set
			[151350] = true,	--	17	Winter Veil Gift							Toy - Toy Weapon Set
			[151345] = true,	--	17	Gently Shaken Gift							Toy - Hearthstation
			[139343] = true,	--	16	Gently Shaken Gift							Toy - Disposable Winter Veil Suits
			[139341] = true,	--	16	Winter Veil Gift							Toy - Endothermic Blaster
			[128653] = true,	--	15	Winter Veil Gift							Toy - Crashin' Thrashin' Flamer Controller
			[128652] = true,	--	15	Gently Shaken Gift							Toy - Red Wooden Shield
			[116761] = true,	--	14	Winter Veil Gift							Toy - Crashin' Thrashin' Shredder Controller
			[104319] = true,	--	13	Winter Veil Gift							Toy - Crashin' Thrashin' Flyer Controller
			[ 90892] = true,	--	12	Winter Veil Gift							Toy - Special Edition Foot Ball & The Pigskin
			[ 70938] = true,	--	11	Winter Veil Gift							Mog - Gaudy Winter Veil Sweater
			[ 67443] = true,	--	10	Winter Veil Gift							Toy - MiniZep Controller
			[ 46740] = true,	--	SS	Winter Veil Gift
			[ 43504] = true,	--	SS	Winter Veil Gift
			[ 34426] = true,	--	SS	Winter Veil Gift
			[ 21271] = true,	--	SS	Gently Shaken Gift
			[ 21270] = true,	--	SS	Gently Shaken Gift

	--	Remixed Mists of Pandaria					One Time Event?
			[223911] = true,	--		Greater Bronze Cache
			[223910] = true,	--		Bronze Cache
			[223909] = true,	--		Lesser Bronze Cache
			[223908] = true,	--		Minor Bronze Cache
			[221509] = true,	--		Timerunner's Weaponry
			[211279] = true,	--		Cache of Infinite Treasure

}
		
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpenEV:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpenEV:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpenEV:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpenEV:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpenEV:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpenEV:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpenEV:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpenEV:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpenEV:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpenEV:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	
	for bag = 0, 4 do
		for slot = 0, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItemsEV[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFFE3E34FEV " .. C_Container.GetContainerItemLink(bag, slot))
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
