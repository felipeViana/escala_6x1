-- o sceneManager é uma pilha de cenas do jogo, que serve para podermos controlar o que está sendo mostrado no jogo e o que precisa ser atualizado ou não.

-- currentScene é sempre a cena do topo da pilha

local sceneManager = {}

local emptyFunc = function()
end

-- varíavel para guardar a pilha de cenas
local screenStack = {}

function sceneManager._validateScene(s)
  s = s or {}

  s.load = s.load or emptyFunc
  s.unload = s.unload or emptyFunc
  s.update = s.update or emptyFunc
  s.draw = s.draw or emptyFunc
  s.resize = s.resize or emptyFunc
  s.keypressed = s.keypressed or emptyFunc
  s.textinput = s.textinput or emptyFunc
  s.mousepressed = s.mousepressed or emptyFunc

  s.name = s.name or nil
  s.comingBack = s.comingBack or emptyFunc
  return s
end

-- troca cena pela desejada, passada pelo primeiro parâmetro s
-- esse método remove todas as cenas da pilha e adiciona a cena desejada no lugar
function sceneManager.changeScene(s, option)
  s = s or error("ChangeScene requires a Scene")

  for i = 1, #screenStack do
    screenStack[i].unload()
  end

  screenStack = {s}

  sceneManager.currentScene = sceneManager._validateScene(s)
  sceneManager.currentScene.load(option)
end

-- método push como o de uma pilha normal,
-- adiciona uma nova cena ao topo da pilha
-- o segundo argumento (option) serve para
-- passar dados para a cena
function sceneManager.pushScene(s, option)
  s = s or error("pushScene requires a scene")

  table.insert(screenStack, s)
  sceneManager.currentScene = sceneManager._validateScene(s)
  sceneManager.currentScene.load(option)
end

-- método pop como o de uma pilha normal,
-- remove a cena do topo da pilha
function sceneManager.popScene(load)
  if #screenStack < 2 then
    error("popScene requires at least one extra scene to go back to")
  end

  sceneManager.currentScene.unload()
  table.remove(screenStack, #screenStack)
  sceneManager.currentScene = screenStack[#screenStack]
  sceneManager.currentScene.comingBack()
  if load then
    sceneManager.currentScene.load()
  end
end

-- método útil para saber qual a cena no topo da pilha
function sceneManager.getCurrentScene()
  return sceneManager.currentScene
end

function sceneManager.draw()
  -- draw all screens on stack
  for i = 1, #screenStack do
    screenStack[i].draw()
  end
end

function sceneManager.resetScene()
  sceneManager.currentScene.unload()
  sceneManager.currentScene.load()
end

sceneManager.currentScene = sceneManager._validateScene(nil)
return sceneManager
