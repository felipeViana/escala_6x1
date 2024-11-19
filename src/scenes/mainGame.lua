local sceneManager = require "src/common/sceneManager"

local scene = {}

function scene.load()
  love.graphics.setBackgroundColor(0.4, 0.5, 0.3, 1)
end

function scene.unload()
end

function scene.update(dt)
end

function scene.draw()
  love.graphics.print("Tela de jogo principal", 400, 300)
end

function scene.keypressed(key)
  if key == "space" then
    sceneManager.changeScene(require "src/scenes/miniGame")
  end
end

return scene
