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
    self.draggable = false
    --self.dragging = true
    self.touchStart = vec2(0,0)
    self.dragDelta = vec2(0,0)
end

function Sprite:setDraggable(val)
    self.draggable = val
end

function Sprite:draw()
    -- Codea does not automatically call this method
    --print("draw: "..self.imgName..self.x..self.y)
    pushMatrix()
    translate(self.x,self.y)
    rotate(self.r)
    sprite("Project:"..self.imgName,0,0,self.w,self.h)
    text("r:"..self.r,0,-self.h/2 - 10)
    if self.dragging then
        local p = vec2(self.dragDelta[1],self.dragDelta[2])
        p = p:rotate(-self.r)
        sprite("Project:"..self.imgName,p[1],p[2],self.w,self.h)
    end
    popMatrix()
end

function Sprite:touched(touch)
    -- Codea does not automatically call this method
    if hitTest(touch.x,touch.y,self.x,self.y,self.w,self.h) then
        if touch.state == BEGAN then
            print("touch began "..self.imgName)
            if self.draggable then
                self.dragging = true
                self.touchStart = vec2(touch.x,touch.y)
            end
        end
    end
    if self.dragging then
        if touch.state == MOVING then
                print("drag: "..self.imgName.."("..touch.x..","..touch.y..")")
                self.dragDelta = vec2(touch.x-self.touchStart[1],touch.y-self.touchStart[2])
        elseif touch.state == ENDED then
            print("touch ended "..self.imgName)
            self.dragging = false
            self.dragDelta = vec2(0,0)
        end
    end
    
end
