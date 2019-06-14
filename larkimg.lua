function love.load()
    screen_width, screen_height = love.graphics.getDimensions()
    prev = {screen_width / 2, screen_height / 2, 255, 255, 255, 10}
    points = {prev}
    love.filesystem.setIdentity('lark2d');
  end
  
  function love.draw()
     love.graphics.points(points)
  end
  
  function love.update(dt)
    local direction = randomDirection()
    local newCoords = calculateNewcoords(prev, direction)
    table.insert(points, newCoords)
    prev = newCoords
  end
  
  function randomDirection()
    local number = love.math.random(1, 4)
    local direction
  
    if number == 1 then
      direction = 'up'
    elseif number == 2 then
      direction = 'right'
    elseif number == 3 then
      direction = 'down'
    else
      direction = 'left'
    end
    return direction
  end
  
  function calculateNewcoords(prev, direction)
    local x = prev[1]
    local y = prev[2]
  
    if direction == 'up' then
      y = y - 1
    elseif direction == 'right' then
      x = x + 1
    elseif direction == 'left' then
      x = x - 1
    else
      y = y + 1
    end
  
    if x < 0 or x > screen_width then
      x = math.random(0, screen_width)
    end
    if y < 0 or y > screen_height then
      y = math.random(0, screen_height)
    end
  
    return {x, y, 255, 255, 255, 10}
  end
  
  function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
      print("Printing!!!")
      love.graphics.captureScreenshot(os.time() .. ".png")
    end
  end
  