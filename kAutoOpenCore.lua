kAutoOpen_Settings = kAutoOpen_Settings or {}

local function NormalizeCooldown(value)
	local cd = tonumber(value)
	if not cd then return 2 end
	if cd < 0 then cd = 0 end
	if cd > 10 then cd = 10 end
	return cd
end

if kAutoOpen_Settings.cooldown == nil then
	kAutoOpen_Settings.cooldown = 2
else
	kAutoOpen_Settings.cooldown = NormalizeCooldown(kAutoOpen_Settings.cooldown)
end

function kAutoOpen_GetCooldown()
	return NormalizeCooldown(kAutoOpen_Settings and kAutoOpen_Settings.cooldown)
end

local function Print(msg)
	if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
		DEFAULT_CHAT_FRAME:AddMessage(msg)
	else
		print(msg)
	end
end

SLASH_KAUTOOPEN1 = "/kao"
SLASH_KAUTOOPEN2 = "/kautoopen"
SlashCmdList["KAUTOOPEN"] = function(msg)
	msg = tostring(msg or "")
	local cmd, rest = msg:match("^(%S+)%s*(.-)%s*$")
	cmd = (cmd or ""):lower()

	if cmd == "cooldown" or cmd == "cd" then
		if rest == "" then
			Print(string.format("|cFFFFD700!AutoOpen|r cooldown: |cFF4FE34F%.1fs|r", kAutoOpen_GetCooldown()))
			return
		end

		local newCd = NormalizeCooldown(rest)
		kAutoOpen_Settings.cooldown = newCd
		Print(string.format("|cFFFFD700!AutoOpen|r cooldown set to: |cFF4FE34F%.1fs|r", newCd))
		return
	end

	Print("|cFFFFD700!AutoOpen|r commands:")
	Print("  /kao cd <seconds>  - set cooldown (0..10)")
	Print("  /kao cd            - show current cooldown")
end
