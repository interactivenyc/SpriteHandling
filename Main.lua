-- SpriteHandling

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    sprite()
    sprites = {}
    local coin = Coin(100,100,70,70,0,"penny")
    coin:setDraggable(true)
    addSprite(coin)
    coin = Coin(300,300,80,80,90,"nickel")
    coin:setDraggable(true)
    addSprite(coin)

end

function addSprite(s)
    sprites[#sprites+1] = s
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(1)

    -- Do your drawing here
    drawGrid()
    drawSprites() 
    if touching == true then
        ellipse(CurrentTouch.x,CurrentTouch.y,50)        
        text("TOUCH",CurrentTouch.x,CurrentTouch.y-30)
    end
end

function touched(touch)
    if touch.state == BEGAN then
        touching = true
    end
    if touch.state == ENDED then
        touching = false
    end
    
    for index=1,#sprites do
        sprites[index]:touched(touch)
    end
end

function drawSprites()
    --print("drawSprites "..#sprites)
    for index=1,#sprites do
        sprites[index]:draw()
    end
end

function drawGrid()
    local gridSize = 50
    for x=0,WIDTH,gridSize do
        line(x,0,x,HEIGHT)
        text(x,x,20)
    end
    for y=0,WIDTH,gridSize do
        line(0,y,WIDTH,y)
        text(y,20,y)
    end
end

function hitTest(px,py,x,y,w,h)
    if px > x and px < x+w and
    py > y and py < y+h then
        return true
    else
        return false
    end
end

