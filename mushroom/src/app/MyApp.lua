
require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
  --加载图片资源
    display.addSpriteFrames("image/mushroom.plist", "image/mushroom.png")

    
    self:enterScene("Mushroom")
end
function MyApp:enterGameScene()
	self:enterScene("Mushroom")
end	

return MyApp
