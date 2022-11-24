include('shared.lua')

function GetAngleBetweenPoints(p1, p2)
	local xDiff = p2.x - p1.x
	local yDiff = p2.y - p1.y

	return math.atan2(yDiff, xDiff) * (180 / math.pi)
end

surface.CreateFont( "Font_petrol", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 70,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()
	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local petrol = self:GetNWInt("PetrolStock")
 	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local draw_distance = 1250
	if LocalPlayer():GetPos():Distance(self:GetPos()) < draw_distance then
		cam.Start3D2D(Pos+Ang:Right()*10+Ang:Up()*55+Ang:Forward()*21, Ang + Angle(0,Ang:RotateAroundAxis(Ang:Up(), 90),Ang:RotateAroundAxis(Ang:Forward(), 90)), 0.1)
			draw.RoundedBox(0,0,0,165,155,Color(200,10,10,150))
			draw.SimpleText("Pétrolle restant:","Trebuchet24",85,40,Color(250,250,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
			draw.SimpleText(math.Round(petrol,0).."%","Font_petrol",85,80,Color(250,250,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
 	
end
