food = {}



food.new = function(x, y, rad, physics, usserdata, usserdata2, type)
    local self = self or {}
    self.x = x
    self.y = y
    self.rad = rad

    self.image = nil
    self.width = nil
    self.height = nil

    if type == 1 then
      self.image = love.graphics.newImage("assets/melon.png")
    elseif type == 2 then
      self.image = love.graphics.newImage("assets/spikepear.png")
    end

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    
  self.world = physics
  self.body = love.physics.newBody(self.world, self.x, self.y, "static")
  
  self.shape = love.physics.newCircleShape(self.rad)
  self.fixture = love.physics.newFixture(self.body, self.shape, 1)


  self.fixture:setMask(16)
  --self.p.prop:setMask(1) NO! Defulat catagory is 1.
  if type == 1 then
  self.fixture:setGroupIndex(-4)
  self.fixture:setCategory(4)
  self.group = -4
  
  elseif type == 2 then
    self.fixture:setGroupIndex(-6)
    self.fixture:setCategory(6)
    self.group = -6
  end
  self.fixture:setUserData(usserdata)
  self.fixture:setSensor(true)
  self.body:setUserData(usserdata2)
 -- self.p.fixture:setSensor(true)

  self.body:setGravityScale(0)

  self.x = self.body:getX()
  self.y = self.body:getY()
  self.angle = self.body:getAngle()


  self.destroy = function ()
    self.body:release()
    self.fixture:release()
    self.body = nil
    self.fixture = nil
  end

  self.draw = function ()
    
    --if self.body then
    if self.group == -4 then
      
    love.graphics.draw(self.image,(self.x),(self.y-5),
        self.angle,0.15,0.15,self.width/2,self.height/2)
        --love.graphics.setColor(0,0,0,255)
        --love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.rad)
        --love.graphics.setColor(128,128,128,255)
    

    elseif self.group == -6 then

      love.graphics.draw(self.image,(self.x),(self.y-10),
        self.angle,0.10,0.10,self.width/2,self.height/2)

    end

    --end
  end

  self.debugdraw = function ()

    if self.group == -4 then
      love.graphics.draw(self.image,(self.x-0.25),(self.y-3),
      self.angle,0.19,0.19,self.width/2,self.height/2)
      --[[
      love.graphics.draw(self.image,(self.x-0.25),(self.y-3),
      self.angle,0.195,0.195,self.width/2,self.height/2)

      ]]--
      
          love.graphics.setColor(0,0,0,255)
          love.graphics.circle("line", self.body:getX(), self.body:getY(), self.rad)
          love.graphics.setColor(128,128,128,255)
      
  
      elseif self.group == -6 then

        love.graphics.draw(self.image,(self.x-1),(self.y-7.5),
        self.angle,0.09,0.09,self.width/2,self.height/2)

          love.graphics.setColor(0,0,0,255)
          love.graphics.circle("line", self.body:getX(), self.body:getY(), self.rad)
          love.graphics.setColor(128,128,128,255)

      end
  end



    return self
end