include("shared.lua")


function ENT:Draw()

    self:DrawModel()

    if ( IsValid( self ) && LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 ) then

         local ang = Angle( 0, ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "yaw" ], ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "pitch" ] ) + Angle( 0, 90, 90 )

        cam.IgnoreZ( false )
        cam.Start3D2D( self:GetPos() + Vector( 0, 0, 78 ), ang, 0.1 )
            draw.RoundedBox(5,-90,-20,180,40,Color(200,10,10,255))
            draw.SimpleTextOutlined( "Vendeur de pétrole", "trebuchet24", 0, 0,Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, .5, Color( 0, 0, 0, 255 ) )
        cam.End3D2D()

    end

end