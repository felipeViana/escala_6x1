local sceneManager = require "src/common/sceneManager"

local scene = {}

-- calendar system
local dayOfWeek = 0
local hour = 0
local min = 0

local hourAngle = 0
local minAngle = 0

-- status system

function scene.load()
  love.graphics.setBackgroundColor(0.4, 0.5, 0.3, 1)
end

function scene.unload()
end

function scene.update(dt)
  min = min + dt * 10
  hour = min / 60

  if hour > 24 then
    dayOfWeek = dayOfWeek + 1
    hour = 0
  end

  if dayOfWeek > 6 then
    dayOfWeek = 0
  end

  minAngle = 2 * math.pi * min / 60 - math.pi / 2
  hourAngle = 2 * math.pi * hour / 12 - math.pi / 2
end

function scene.draw()
  love.graphics.print("Tela de jogo principal", 100, 200)

  love.graphics.print(dayOfWeek, 100, 300)
  love.graphics.print(hour, 100, 350)
  love.graphics.print(min, 100, 400)

  -- clock
  local x = 600
  local y = 150
  local radius = 100

  love.graphics.circle("line", x, y, radius)
  love.graphics.circle("fill", x, y, 5)

  -- draw numbers
  for i = 1, 12 do
    local angle = -math.pi / 2 + math.pi / 6 * i
    love.graphics.print(i, x - 10 + (radius - 20) * math.cos(angle), y - 15 + (radius - 20) * math.sin(angle))
  end

  -- min
  local minX = (radius - 10) * math.cos(minAngle)
  local minY = (radius - 10) * math.sin(minAngle)
  love.graphics.line(x, y, x + minX, y + minY)

  -- hour
  local hourX = (radius - 40) * math.cos(hourAngle)
  local hourY = (radius - 40) * math.sin(hourAngle)
  love.graphics.line(x, y, x + hourX, y + hourY)
end

function scene.keypressed(key)
  if key == "space" then
    sceneManager.changeScene(require "src/scenes/miniGame")
  end
end

return scene
