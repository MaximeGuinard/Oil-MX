include('shared.lua')


function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	surface.SetDrawColor(0,0,0)
	draw.NoTexture()
	surface.DrawPoly( cir )
end


function ENT:Draw()
	self:DrawModel()
	Pos = self:GetPos()
	Ang = self:GetAngles()
	petrol = self:GetNWInt("ActualPetrol")
	local hauteurtext = math.Remap( petrol, 0, 200, 0, 40 )
	local hauteur = math.Remap( petrol, 0, 200, 2, 40 ) 
 	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local draw_distance = 1250
	if LocalPlayer():GetPos():Distance(self:GetPos()) < draw_distance then

		cam.Start3D2D(Pos+Ang:Right()*0+Ang:Up()*hauteur+Ang:Forward()*0, Ang + Angle(0,Ang:RotateAroundAxis(Ang:Up(), 0),Ang:RotateAroundAxis(Ang:Forward(), 0)), 0.1)
			draw.Circle( 0, 0, 137, 32 )
		cam.End3D2D()

		cam.Start3D2D(Pos+Ang:Right()*14.25+Ang:Up()*hauteur+Ang:Forward()*0, Ang + Angle(0,Ang:RotateAroundAxis(Ang:Up(), 0),Ang:RotateAroundAxis(Ang:Forward(), 90)), 0.125)
			draw.RoundedBox(0,-16,0,32,hauteur*8,Color(0,0,0))
			draw.SimpleText(math.Round((hauteurtext*2.5),0).."%","Trebuchet18",0,10,Color(250,140,50),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
 	
end
