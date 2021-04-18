AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/sortinghat/sortinghat.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS) 
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:SetTrigger(true)

    self.Gryffindor = 25
    self.Ravenclaw = 25
    self.Hufflepuff = 25
    self.Slytherin = 25

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then

        phys:Wake()



    end
end

--  Gryffindor, Ravenclaw, Hufflepuff or Slytherin.
function ENT:Use(act, call)
    self.total = self.Gryffindor + self.Ravenclaw + self.Hufflepuff + self.Slytherin 
    
    self.number = math.random(0, 100)
    if number < Gryffindor then
        self:ChatPrint("You belong in Gryffindor")
    

end