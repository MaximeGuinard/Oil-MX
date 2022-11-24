AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua")

include("shared.lua") 

function ENT:Initialize( ) 
	self:SetModel( "models/odessa.mdl" )
	self:SetHullType( HULL_HUMAN ) 
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX ) 
	self:CapabilitiesAdd( CAP_ANIMATEDFACE ) 
	self:CapabilitiesAdd( CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE ) 
	self:DropToFloor()
	self:SetMaxYawSpeed( 90 ) 
end

function ENT:OnTakeDamage()
	return false 
end 


function ENT:AcceptInput( Name, Activator, Caller )	

	if Name == "Use" and Caller:IsPlayer() then
		
		local ent = ents.FindByClass("bidon")
		for i,v in ipairs(ent) do
			if v:CPPIGetOwner() == Activator then
				local self_pos = self:GetPos()
				local v_pos = v:GetPos()
				local distance = self_pos:Distance(v_pos)
				print(distance)
				if distance <= 60 then
					local petrol = v:GetNWInt("ActualPetrol")
					v:SetNWInt("ActualPetrol",0)
					local price = petrol * 4
					print(price)
					Activator:addMoney(price)
					DarkRP.notify(Activator,0,10,"vous venez de vendre "..math.Round(petrol,0).." litres de petrole pour "..math.Round(price,0).." €" )
				else
					DarkRP.notify(Activator,1,10,"votre baril de petrole est trop loin" )
				end
			end
		end
	end
end
