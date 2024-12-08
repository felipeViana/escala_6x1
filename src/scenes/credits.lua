local sceneManager = require "src/common/sceneManager"
local colors = require "src/common/colors"
local buttonClass = require "src/components/button"

local scene = {}

local button
local buttonText = "Voltar"

local function backScene()
  sceneManager.changeScene(require "src/scenes/title")
end

function scene.load()
  love.graphics.setBackgroundColor(colors.black)

  button = buttonClass({text = buttonText, fn = backScene})
end

function scene.unload()
end

function scene.update(dt)
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  local buttonX = windowWidth / 2 - fontMedium:getWidth(buttonText) / 2
  local buttonY = windowHeight - 100 - fontMedium:getHeight(buttonText)

  button:setX(buttonX)
  button:setY(buttonY)
end

function scene.draw()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  -- title
  love.graphics.setColor(colors.lightGrey)

  local title = "Créditos"
  love.graphics.setFont(fontBig)
  local titleWidth = fontBig:getWidth(title)
  love.graphics.print(title, windowWidth / 2 - titleWidth / 2, 100)

  -- contributors
  local text1 = "Felipe Viana: Game Designer, Programador, Artista"
  local text2 = "Fernanda Galindo: Programadora, QA"
  local text3 = "Gabe Abreu: QA"
  local text4 = "Alex Galindo: Música"

  love.graphics.setFont(fontSmall)

  local startY = windowHeight / 2 - 100
  local dy = 50

  local textWidth = fontSmall:getWidth(text1)
  local x = windowWidth / 2 - textWidth / 2

  love.graphics.print(text1, x, startY)
  love.graphics.print(text2, x, startY + dy)
  love.graphics.print(text3, x, startY + 2 * dy)
  love.graphics.print(text4, x, startY + 3 * dy)

  -- back button
  button:draw()
end

function scene.mousepressed(mx, my, mouseButton)
  button:pressed(mx, my, mouseButton)
end

return scene
