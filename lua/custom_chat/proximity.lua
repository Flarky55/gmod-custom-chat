local Proximity = CustomChat.Proximity or { Modes = {} }
CustomChat.Proximity = Proximity


function Proximity:GetMode( id )
    return self.Modes[id]
end

function Proximity:CreateMode( id, fnGetDistance )
    local modeTbl = self.Modes[id]
    if not modeTbl then
        modeTbl = { id = id }
        modeTbl.index = table.insert( self.Modes, modeTbl )
        self.Modes[id] = modeTbl
    end

    modeTbl.getDistance = fnGetDistance
end


local function GetPlayerDistance( ply )
    return ply:GetInfoNum( "custom_chat_proximity_default_distance", 300 )
end

Proximity:CreateMode( "default",    GetPlayerDistance )
Proximity:CreateMode( "yell",       function( ply ) return math.min( GetPlayerDistance( ply ) * 2, 1500 ) end )
Proximity:CreateMode( "whisper",    function()      return 50 end )