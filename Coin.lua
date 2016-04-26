Coin = class(Sprite)

function Coin:init(x,y,w,h,r,imgName)
    -- you can accept and set parameters here
    self:setupSprite(x,y,w,h,r,imgName)
    self.draggable = true
end