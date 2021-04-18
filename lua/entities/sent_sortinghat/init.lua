AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local Hatvoicelines = { -- you can add more voice lines here, 

    "I see, not a bad mind",
    "There's talent, oh yes",
    "Not a bad mind",
    "Hmm, difficult. VERY difficult",
    "There's talent, oh yes"  -- Remember you dont need a comma at the last one

}

function ENT:Initialize()
    self:SetModel("models/sortinghat/sortinghat.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS) 
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:SetTrigger(true)

    self.Gryffindor = 25 -- change these to change the chance
    self.Ravenclaw = 25
    self.Hufflepuff = 25
    self.Slytherin = 25



    self.active = true

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then

        phys:Wake()



    end
end


function ENT:Use(act, call)
    if self.active then
        self.active = false
        self.total = self.Gryffindor + self.Ravenclaw + self.Hufflepuff + self.Slytherin  

        self.Gryffindorchance = self.Gryffindor / self.total * 100
        self.Ravenclawchance = self.Ravenclaw / self.total * 100 + self.Gryffindorchance
        self.Hufflepuffchance = self.Hufflepuff / self.total * 100 + self.Ravenclawchance
        self.Slytherinchance = self.Slytherin / self.total * 100 + self.Hufflepuffchance

        self.linescount = 0
        call:ChatPrint("Hmmmm let me see") -- First thing he says

        timer.Create( "UniqueName1", 3, 2, function() 
            call:ChatPrint(Hatvoicelines[math.random(1, table.getn(Hatvoicelines))]) 

            self.linescount = self.linescount + 1
            if self.linescount == 2 then
                self.number = math.random(0, 100)

                if self.number <  self.Gryffindorchance then
                    call:ChatPrint("You belong in Gryffindor, " .. call:Nick())
                    self:EmitSound("gryffindor.wav")
                    self.active = true
                elseif self.number < self.Ravenclawchance then
                    call:ChatPrint("You belong in Ravenclaw, " .. call:Nick())
                    self:EmitSound("ravenclaw.wav")
                    self.active = true
                elseif self.number < self.Hufflepuffchance then
                    call:ChatPrint("You Belong in Hufflepuff, " .. call:Nick())
                    self:EmitSound("hufflepuff.wav")
                    self.active = true
                elseif self.number < self.Slytherinchance then
                    call:ChatPrint("You Belong in Slytherin, " .. call:Nick())
                    self:EmitSound("slytherin.wav")
                    self.active = true
                end
            end
        end)
    end

end