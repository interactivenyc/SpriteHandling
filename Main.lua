-- SpriteHandling

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    sprite()
    sprites = {}
    players = {}
    
    local player
    player = Player("player",1,0)
    addPlayer(player)
    player = Player("player",2,90)
    addPlayer(player)
    player = Player("player",3,180)
    addPlayer(player)
    player = Player("player",4,-90)
    addPlayer(player)
    
    print(1-((math.pi*2)/360))
    
end

function addPlayer(p)
    players[#players+1] = p
end

function addSprite(s)
    --print("addSprite "..s.imgName)
    sprites[#sprites+1] = s
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(1)

    -- Do your drawing here
    drawTable()
    drawPlayers() 
    drawSprites() 
    drawGrid()
    
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
    for index=1,#players do
        players[index]:touched(touch)
    end
end

function drawSprites()
    --print("drawSprites "..#sprites)
    for index=1,#sprites do
        sprites[index]:draw()
    end
end

function drawPlayers()
    --print("drawSprites "..#sprites)
    for index=1,#players do
        players[index]:draw()
    end
end

function drawTable()
    pushMatrix()
    pushStyle()
    translateCenter()
    fill(65, 176, 225, 255)
    rect(-225,-225,450,450)
    popStyle()
    popMatrix()
end

function translateCenter()
    translate(WIDTH/2,HEIGHT/2)
end

function drawGrid()
    local gridSize = 100
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

