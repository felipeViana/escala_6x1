function love.conf(t)
  t.identity = nil -- save directory (string)
  t.author = "felipeViana"
  t.accelerometerjoystick = false
  t.title = "Escala 6 x 1"
  t.version = "11.5"
  t.console = true

  t.window.width = 800
  t.window.height = 600
  t.window.fullscreen = false
  -- t.window.icon = "assets/logo.png"
  t.window.borderless = false
  t.window.resizable = true

  t.modules.audio = true
  t.modules.event = true
  t.modules.font = true
  t.modules.graphics = true
  t.modules.keyboard = true
  t.modules.math = true
  t.modules.sound = true
  t.modules.timer = true
  t.modules.window = true
  t.modules.image = true
  t.modules.mouse = true

  t.modules.data = false
  t.modules.joystick = false
  t.modules.physics = false
  t.modules.system = false
  t.modules.thread = false
  t.modules.touch = false
  t.modules.video = false

  math.randomseed(os.time())
end
