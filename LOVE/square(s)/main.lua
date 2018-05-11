function love.load()
    require 'mapGen'
    love.graphics.setDefaultFilter('nearest','nearest')
    playerSprite = love.graphics.newImage('sprite.png')
	player = {
		grid_x = 256,
		grid_y = 256,
		act_x = 256,
        act_y = 256,
        speed = 10
    }
    test = 15

	map = map(20,15)
end

function testMap(x,y)
    if map[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then
        return false
    end
    return true
end
 
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end
 
function love.draw()

    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
                love.graphics.rectangle('line',(x-1)*32,(y-1)*32,32,32)
            end
        end
    end

    --love.graphics.rectangle("fill", player.act_x, player.act_y, 32, 32)
    love.graphics.draw(playerSprite,player.act_x,player.act_y,0,2,2)
    
end
 
function love.keypressed(key)
    if key == "up" then
        if testMap(0, -1) then
            player.grid_y = player.grid_y - 32
        end
    elseif key == "down" then
        if testMap(0,1) then
            player.grid_y = player.grid_y + 32
        end
    elseif key == "left" then
        if testMap(-1,0) then
            player.grid_x = player.grid_x - 32
        end
    elseif key == "right" then
        if testMap(1,0) then
            player.grid_x = player.grid_x + 32
        end
	end
end