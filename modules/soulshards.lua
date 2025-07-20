if( not ShadowUF.ComboPoints ) then return end

local Souls = setmetatable({}, {__index = ShadowUF.ComboPoints})
ShadowUF:RegisterModule(Souls, "soulShards", ShadowUF.L["Soul Shards"], nil, "WARLOCK")
local soulsConfig = {max = 5, key = "soulShards", colorKey = "SOULSHARDS", powerType = Enum.PowerType.SoulShards, eventType = "SOUL_SHARDS", icon = "Interface\\AddOns\\ShadowedUnitFrames\\media\\textures\\shard"}

function Souls:OnEnable(frame)
	frame.soulShards = frame.soulShards or CreateFrame("Frame", nil, frame)
	frame.soulShards.cpConfig = soulsConfig
	-- MOP Classic: GetSpecialization() doesn't exist, use default values for MOP Classic compatibility
	frame.soulShards.cpConfig.max = 5
	frame.soulShards.cpConfig.grouping = 1
	frame.comboPointType = soulsConfig.key

	frame:RegisterUnitEvent("UNIT_POWER_FREQUENT", self, "Update")
	frame:RegisterUnitEvent("UNIT_MAXPOWER", self, "UpdateBarBlocks")
	frame:RegisterUnitEvent("UNIT_DISPLAYPOWER", self, "Update")
	frame:RegisterNormalEvent("PLAYER_SPECIALIZATION_CHANGED", self, "SpecChanged")

	frame:RegisterUpdateFunc(self, "Update")
	frame:RegisterUpdateFunc(self, "UpdateBarBlocks")
end

function Souls:OnLayoutApplied(frame, config)
	ShadowUF.ComboPoints.OnLayoutApplied(self, frame, config)
	self:UpdateBarBlocks(frame)
end

function Souls:SpecChanged(frame)
	-- update shard count on spec swap
	if frame and frame.soulShards then
		-- MOP Classic: GetSpecialization() doesn't exist, use default values for MOP Classic compatibility
		frame.soulShards.cpConfig.max = 5
		frame.soulShards.cpConfig.grouping = 1
	end
	self:UpdateBarBlocks(frame)
end

function Souls:GetComboPointType()
	return "soulShards"
end

function Souls:GetPoints(unit)
	-- MOP Classic: GetSpecialization() doesn't exist, use default behavior
	return UnitPower("player", soulsConfig.powerType)
end

function Souls:GetMaxPoints(unit)
	-- MOP Classic: GetSpecialization() doesn't exist, use default behavior
	return UnitPowerMax("player", soulsConfig.powerType)
end
