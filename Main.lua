-- SpriteHandling

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    sprite()
    sprites = {}
    local coin = Coin(100,100,70,70,0,"penny")
    addSprite(coin)
    
    coin = Coin(400,400,80,80,90,"nickel")
    addSprite(coin)

    coin = Coin(700,700,65,65,180,"dime")
    addSprite(coin)

    coin = Coin(650,650,65,65,0,"dime")
    addSprite(coin)
 
    coin = Coin(700,100,65,65,0,"dime")
    addSprite(coin)
    
    coin = Coin(100,700,65,65,0,"dime")
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
    
    --draw circle indicating where touches are happening - helps video to make sense
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

