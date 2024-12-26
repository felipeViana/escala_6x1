local sceneManager = require "src/common/sceneManager"
local colors = require "src/common/colors"
local buttonClass = require "src/components/button"

local scene = {}

-- ## global variables ##
-- fontBig
-- fontMedium
-- fontSmall

local music = love.audio.newSource("assets/fonts/songs/Doomer_Bass.mp3", "stream")

local verticalGap = 110

local title = "Escala 6 x 1"
local text1 = "Jogar"
local text2 = "Créditos"
local text3 = "Sair"

local button1
local button2
local button3

local buttonsList = {}

local function playGame()
  music:stop()
  sceneManager.changeScene(require "src/scenes/mainGame")
end

local function credits()
  sceneManager.changeScene(require "src/scenes/credits")
end

local function quitGame()
  love.event.quit(0)
end

function scene.load()
  love.graphics.setBackgroundColor(colors.black)

  fontBig = love.graphics.newFont("assets/fonts/Voltaire-Frangela.ttf", 48)
  fontMedium = love.graphics.newFont("assets/fonts/Voltaire-Frangela.ttf", 32)
  fontSmall = love.graphics.newFont("assets/fonts/Voltaire-Frangela.ttf", 24)

  music:setLooping(true)
  music:play()

  button1 = buttonClass({text = text1, fn = playGame})
  button2 = buttonClass({text = text2, fn = credits})
  button3 = buttonClass({text = text3, fn = quitGame})

  table.insert(buttonsList, button1)
  table.insert(buttonsList, button2)
  table.insert(buttonsList, button3)
end

function scene.unload()
  buttonsList = {}
end

function scene.update(dt)
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  button1:setX(windowWidth / 2 - fontMedium:getWidth(text1) / 2)
  button2:setX(windowWidth / 2 - fontMedium:getWidth(text2) / 2)
  button3:setX(windowWidth / 2 - fontMedium:getWidth(text3) / 2)

  local y0 = windowHeight / 2 - 30
  button1:setY(y0)
  button2:setY(y0 + verticalGap)
  button3:setY(y0 + 2 * verticalGap)
end

function scene.draw()
  local windowWidth = love.graphics.getWidth()

  love.graphics.setColor(colors.lightGrey)
  love.graphics.setFont(fontBig)
  local titleWidth = fontBig:getWidth(title)
  love.graphics.print(title, windowWidth / 2 - titleWidth / 2, 100)

  for k in pairs(buttonsList) do
    buttonsList[k]:draw()
  end
end

function scene.mousepressed(mx, my, mouseButton)
  for k in pairs(buttonsList) do
    -- if condition because of unload happening before this loop ends
    if buttonsList[k] then
      buttonsList[k]:pressed(mx, my, mouseButton)
    end
  end
end

return scene
