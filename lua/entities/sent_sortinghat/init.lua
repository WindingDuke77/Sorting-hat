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
    self.time = CurTime()

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then

        phys:Wake()



    end
end

--  Gryffindor, Ravenclaw, Hufflepuff or Slytherin.
function ENT:Use(act, call)
    self.total = self.Gryffindor + self.Ravenclaw + self.Hufflepuff + self.Slytherin 

    self.Gryffindorchance = self.Gryffindor / self.total * 100
    self.Ravenclawchance = self.Ravenclaw / self.total * 100 + self.Gryffindorchance
    self.Hufflepuffchance = self.Hufflepuff / self.total * 100 + self.Ravenclawchance
    self.Slytherinchance = self.Slytherin / self.total * 100 + self.Hufflepuffchance

    call:ChatPrint("Hmm, difficult. VERY difficult")

    coroutine.wait( 5 )


    self.number = math.random(0, 100)

    if self.number <  self.Gryffindorchance then
        call:ChatPrint("You belong in Gryffindor, " .. call:Nick())
    elseif self.number < self.Ravenclawchance then
        call:ChatPrint("You belong in Ravenclaw, " .. call:Nick())
    elseif self.number < self.Hufflepuffchance then
        call:ChatPrint("You Belong in Hufflepuff, " .. call:Nick())
    elseif self.number < self.Slytherinchance then
        call:ChatPrint("You Belong in Slytherin, " .. call:Nick())
    end
end