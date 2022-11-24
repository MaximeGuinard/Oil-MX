AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/props_phx/empty_barrel.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetNWInt("MaxPetrol",200)
	self:SetNWInt("ActualPetrol",0)
end


function ENT:AcceptInput( name, activator, caller )
	Pos = self:GetPos()
	Ang = self:GetAngles()
    if ( name == "Use" && activator:IsPlayer() ) then

	end
end


function ENT:Touch( entity )
	local petrol_stock = entity:GetNWInt("PetrolStock")
	local actual_petrol = self:GetNWInt("ActualPetrol")
	local max_petrol = self:GetNWInt("MaxPetrol")
	timer.Simple(0.5,function()
	if actual_petrol < max_petrol then
		if actual_petrol <= max_petrol then
			self:SetNWInt("ActualPetrol",actual_petrol+petrol_stock/10)
			print(entity:GetNWInt("PetrolStock"))
			entity:SetNWInt("PetrolStock",petrol_stock - petrol_stock/10)
			if self:GetNWInt("ActualPetrol") >= max_petrol then
				self:SetNWInt("ActualPetrol",self:GetNWInt("MaxPetrol"))
			end
		end 
	end
	end)
	
end