local sceneManager = require "src/common/sceneManager"
local titleScene = require "src/scenes/title"

function love.load()
  -- chama a cena inicial do jogo
  sceneManager.changeScene(titleScene)
end

-- passar todos os métodos da love para a cena atual
function love.update(dt)
  sceneManager.currentScene.update(dt)
end

function love.draw()
  -- o método de draw é diferente porque o sceneManager deve renderizar outras cenas além da atual, pois pode ter várias cenas empilhadas como pop-ups (não necessariamente cada cena ocupa a tela toda)
  sceneManager.draw()
end

function love.keypressed(key)
  sceneManager.currentScene.keypressed(key)

  if key == "escape" then
    -- aqui um exemplo de comportamento global, posso fazer com o botão ESC feche o jogo, independente da cena em que estiver
    love.event.quit(0)
  end
end

function love.mousepressed(x, y, button)
  sceneManager.currentScene.mousepressed(x, y, button)
end

function love.textinput(t)
  sceneManager.currentScene.textinput(t)
end
