
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
   
  	self:loadCacheSprite()
    self:enterScene("Mushroom")
end

function MyApp:loadCacheSprite()
  display.addSpriteFrames("image/mushroom.plist", "image/mushroom.png")
end

function MyApp:releaseaSpriteCache()
    display.removeSpriteFramesWithFile("image/mushroom.plist", "image/mushroom.png")
end

function MyApp:enterMushroom()
 --加载图片资源
 	self:releaseaSpriteCache()
 	self:loadCacheSprite()
	
	self:enterScene("Mushroom")
end	

function MyApp:enterGameScene()
	 --加载图片资源
 	self:releaseaSpriteCache()
 	self:loadCacheSprite()
    
	self:enterScene("GameScene")
end	




return MyApp
