AddCSLuaFile( "shared.lua" )
include('shared.lua')

ENT.eastereggsModel = "models/easteregg/easteregg.mdl"
ENT.eastereggsSound = "/eggcrunshing/eggcrunshing.wav"
function ENT:Initialize()
	self:SetModel( self.eastereggsModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetColor(Color(153,0,115))
	local phys = self.Entity:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end