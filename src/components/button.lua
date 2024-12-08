local colors = require "src/common/colors"

local dx = 30
local dy = 20

local function setButtonX(self, x)
  self.x = x
end

local function setButtonY(self, y)
  self.y = y
end

local function buttonDraw(self)
  -- text
  love.graphics.setFont(fontMedium)
  local width = fontMedium:getWidth(self.text) + 2 * dx
  local height = fontMedium:getHeight(self.text) + 2 * dy
  love.graphics.setColor(colors.lightGrey)
  love.graphics.print(self.text, self.x, self.y)

  -- rectangle
  love.graphics.setColor(colors.darkGrey)
  love.graphics.rectangle("line", self.x - dx, self.y - dy, width, height)

  -- button hover
  local mx, my = love.mouse.getPosition()
  if mx >= self.x - dx and mx <= self.x - dx + width then
    if my >= self.y - dy and my <= self.y - dy + height then
      love.graphics.setColor(colors.white)
      love.graphics.print(self.text, self.x, self.y)
      love.graphics.rectangle("line", self.x - dx, self.y - dy, width, height)
    end
  end
end

local function mousePressed(self, mx, my, mouseButton)
  local width = fontMedium:getWidth(self.text) + 2 * dx
  local height = fontMedium:getHeight(self.text) + 2 * dy

  if mouseButton == 1 then
    if mx >= self.x - dx and mx <= self.x - dx + width then
      if my >= self.y - dy and my <= self.y - dy + height then
        self.fn()
      end
    end
  end
end

local function newButton(opts)
  local buttonInstance = {}

  buttonInstance.x = opts.x or 0
  buttonInstance.y = opts.y or 0
  buttonInstance.text = opts.text or "undefined"
  buttonInstance.fn = opts.fn or nil

  buttonInstance.draw = buttonDraw
  buttonInstance.setX = setButtonX
  buttonInstance.setY = setButtonY
  buttonInstance.pressed = mousePressed

  return buttonInstance
end

return newButton
