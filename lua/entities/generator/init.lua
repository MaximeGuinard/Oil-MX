AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/props_vehicles/generatortrailer01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetNWInt("PetrolStock",0)
end


function ENT:AcceptInput( name, activator, caller )
	Pos = self:GetPos()
	Ang = self:GetAngles()
    if ( name == "Use" && activator:IsPlayer() ) then

	end
end

function ENT:OnTakeDamage(dmg)
	local weapon = dmg:GetAttacker():GetActiveWeapon():GetClass() 
	if weapon == "mgs_pickaxe" then
		self:SetNWInt("PetrolStock",math.Clamp(self:GetNWInt("PetrolStock")+1.5,0,100 ) )
	end
 end