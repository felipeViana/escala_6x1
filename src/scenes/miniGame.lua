local sceneManager = require "src/common/sceneManager"

local scene = {}

function scene.load()
  love.graphics.setBackgroundColor(0.1, 0.3, 0.8, 1)
end

function scene.unload()
end

function scene.update(dt)
end

function scene.draw()
  love.graphics.print("Tela de mini jogo", 500, 250)
end

function scene.keypressed(key)
  if key == "space" then
    sceneManager.changeScene(require "src/scenes/title")
  end
end

return scene
