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
    self.dragging = false
    self.touchStart = vec2(0,0)
    self.dragDelta = vec2(0,0)
    
end

function Sprite:setDraggable(val)
    self.draggable = val
end

function Sprite:draw()
    -- Codea does not automatically call this method
    --print("draw: "..self.imgName.."("..self.x..","..self.y..")")
    pushMatrix()
    translate(self.x,self.y)
    rotate(self.r)
    sprite("Project:"..self.imgName,0,0,self.w,self.h)
    text("r:"..self.r,0,-self.h/2 - 10)
    if self.dragging then
        popMatrix()
        pushMatrix()
        translate(self.x+self.dragDelta.x,self.y+self.dragDelta.y)
        rotate(self.r)
        sprite("Project:"..self.imgName,0,0,self.w,self.h)
    end
    popMatrix()
end

function Sprite:touched(touch)
    -- Codea does not automatically call this method

    if hitTest(touch.x,touch.y,self.x-self.w/2,self.y-self.h/2,self.w,self.h) then
        print("touched: "..self.imgName)
        if touch.state == BEGAN then
            print("touch began "..self.imgName)
            if self.draggable ==true then
                self.dragging = true
                self.touchStart = vec2(touch.x,touch.y)
            end
        end
    end
    if self.dragging then
        if touch.state == MOVING then
                --print("drag: "..self.imgName.."("..touch.x..","..touch.y..")")
                self.dragDelta = vec2(touch.x-self.touchStart.x,touch.y-self.touchStart.y)
        elseif touch.state == ENDED then
            print("touch ended "..self.imgName)
            self.dragging = false
            self.dragDelta = vec2(0,0)
        end
    end
    
end
