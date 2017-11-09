
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

function MyApp:enterMushroom(scene)
 --加载图片资源
  self:releaseaSpriteCache()
  self:loadCacheSprite()
  
    local scenePackageName = self.packageRoot .. ".scenes." .. scene
    local sceneClass = require(scenePackageName)
    local scene = sceneClass.new()
    local transition = cc.TransitionFadeTR:create(1, scene) 
    cc.Director:getInstance():pushScene(transition)

end 

function MyApp:enterGameScene(scene)
   --加载图片资源
  self:releaseaSpriteCache()
  self:loadCacheSprite()


--[[  第一种写法 --cocos2dx 基层代码实现场景过渡 
    local scenePackageName = self.packageRoot .. ".scenes." .. scene
    local sceneClass = require(scenePackageName)
    local scene = sceneClass.new()
    local transition = cc.TransitionJumpZoom:create(1, scene) 
    cc.Director:getInstance():pushScene(transition)
--]]

    --第二种写法 display封装了cocos2dx实现场景过渡
--[[   -- local nextScene =display.newScene(scene)--特别注意 
        这里用display获取到的scene实例相当于新创建了一个空白的Scene
        也就是跳入会看到黑屏的原因
--]]
    local scenePackageName = self.packageRoot .. ".scenes." .. scene
    local sceneClass = require(scenePackageName)
    local nextScene = sceneClass.new()
    local transition = display.wrapSceneWithTransition(nextScene, "jumpZoom",1)
          display.replaceScene(transition)
          
     --[[-勉强算第三种写法 是第二种的升级版-]]--display.replaceScene(nextScene, "jumpZoom", 1)
  
end 

return MyApp

--display 中的过渡效果名 请参考display类

-- cocos2dx引擎 过场动画类   更多内容请参考 http://www.cocos2d-x.org/docs/api-ref/cplusplus/v3x/index.html
--[[TransitionCrossFade, 
  TransitionFade, --Fade out the outgoing scene and then fade in the incoming scene.
  TransitionFadeTR,-- Fade the tiles of the outgoing scene from the left-bottom corner the to top-right corner
  TransitionJumpZoom, --Zoom out and jump the outgoing scene, and then jump and zoom in the incoming
  TransitionMoveInL, --Move in from to the left the incoming scene.
  TransitionPageTurn,(注意有三个参数，第三个参数为boolean) -- transition which peels back the bottom right hand corner of a scene to transition to the scene beneath it simulating a page turn
  TransitionProgress,
  TransitionRotoZoom, --Rotate and zoom out the outgoing scene, and then rotate and zoom in the incoming.
  TransitionSceneOriented,(三个参数，第三个参数为角度)
  TransitionShrinkGrow, --Shrink the outgoing scene while grow the incoming scene
  TransitionSlideInL,  --Slide in the incoming scene from the left border
  TransitionSplitCols, --The odd columns goes upwards while the even columns goes downwards.
  TransitionTurnOffTiles.--Turn off the tiles of the outgoing scene in random order
--]]
