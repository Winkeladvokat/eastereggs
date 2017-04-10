AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include( "shared.lua" )


function ENT:SpawnFunction( ply, tr, ClassName )
	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 6

	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	
	return ent
	
end

function ENT:Initialize()
	self:SetModel( self.eastereggsModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	
	local phys = self.Entity:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use( activator )
	
	if gmod.GetGamemode().Name == "DarkRP" then
		local energy = activator:getDarkRPVar("Energy")
		activator:setSelfDarkRPVar( "Energy", math.Clamp( (energy or 100) + eastereggs.hungerSatisfy, 0, 100 ) )
	else
		local health = activator:Health()
		activator:SetHealth( math.Clamp( ( health or 100 ) + eastereggs.hungerSatisfy, 0, 100 ) )
	end
	activator:EmitSound( self.eastereggsSound, 50, 100 )
	self:Remove()
end