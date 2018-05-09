function love.load()
    x = 100
    y = 100
    dx = 0
    dy = 0
    speed = 3
    xLimit = 720
    yLimit = 540
    love.window.setMode(xLimit,yLimit)
end

function love.update()

end

function love.draw()

    dx = 0
    dy = 0
    xInput = false
    yInput = false

    if love.keyboard.isDown('left') and x + (dx * speed) > 0 then
        dx = dx - 1
        xInput = true
    end

    if love.keyboard.isDown('right') and x + (dx * speed) + 50 < xLimit then
        dx = dx + 1
        xInput = true
    end

    if love.keyboard.isDown('up') and y + (dy * speed) > 0 then
        dy = dy - 1
        yInput = true
    end

    if love.keyboard.isDown('down') and y + (dy * speed) + 50 < yLimit then
        dy = dy + 1
        yInput = true
    end

    if xInput and yInput then
        x = x + (dx * (speed * 2/3))
        y = y + (dy * (speed * 2/3))
    else
        x = x + (dx * speed)
        y = y + (dy * speed)
    end
    

    
    love.graphics.rectangle('fill',x,y,50,50)
end



