local kAutoOpenXX = CreateFrame('Frame')

kAutoOpenXX:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

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
	
	--	Added these here to open other parts when I need to edit them			--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenXX.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenMX.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpenEV.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen12.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen11.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen10.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen09.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen08.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen07.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen06.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen05.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen04.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen03.lua
	--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen02.lua		--	file:///C:\WoW\_retail_\Interface\AddOns\kAutoOpen\kAutoOpen01.lua
	--	WoW is in the default directory, Created a secondary path "C:\WoW\" with junction https://learn.microsoft.com/en-us/sysinternals/downloads/junction)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	XX	WORLD OF WARCRAFT:	EXCEPTION CACHES
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local autoOpenItemsXX = {

	--	Unopenable Items, 



}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  |  -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --

function kAutoOpenXX:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpenXX:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpenXX:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpenXX:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpenXX:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpenXX:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpenXX:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpenXX:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpenXX:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpenXX:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	if InCombatLockdown and InCombatLockdown() then return end
	if C_Loot and C_Loot.IsLootOpen and C_Loot.IsLootOpen() then return end
	
	for bag = 0, 4 do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			--	Alliance Portal Room
			if	GetMinimapZoneText() == "Wizard's Sanctum" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
			--	Horde Portal Room
			if	GetMinimapZoneText() == "Pathfinder's Den" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
			--	Dalaran Portal Room
			if	GetMinimapZoneText() == "Chamber of the Guardian" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
			--	Dornogal
			if	GetMinimapZoneText() == "Foundation Hall" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
			--	Caverns of Time
			if	GetMinimapZoneText() == "Caverns of Time" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end
			--	Stonelight Rest
			if	GetMinimapZoneText() == "Stonelight Rest" and id and autoOpenItemsXX[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700!AutoOpen |cFF4FE34FMX " .. C_Container.GetContainerItemLink(bag, slot))
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
