Sprite = class()

--function Sprite:init(x)
--    -- you can accept and set parameters here
--    self.x = x
--end

function Sprite:setupSprite(x,y,w,h,r,imgName)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.r = r
    self.imgName = imgName
end

function Sprite:draw()
    -- Codea does not automatically call this method
    pushMatrix()
    rotate(self.r)
    translate(self.x,self.y)
    sprite("Project:"..self.imageName,self.x,self.y,self.w,self.h)
    text("r:"..self.r,self.x+self.w,self.y)
    popMatrix()
end

function Sprite:touched(touch)
    -- Codea does not automatically call this method
end
