-- SpriteHandling

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    sprite()
    sprites = {}
    local coin = Coin(100,100,70,70,0,"penny")
    addSprite(coin)
    coin = Coin(300,300,80,80,90,"nickel")
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
    
end

function drawSprites()
    --print("drawSprites "..#sprites)
    for index=1,#sprites do
        --print("drawSprite "..sprites[index].imgName)
        local s = sprites[index]
        pushMatrix()
        translate(s.x,s.y)
        rotate(s.r)
        sprite("Project:"..s.imgName,0,0,s.w,s.h)
        popMatrix()
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

