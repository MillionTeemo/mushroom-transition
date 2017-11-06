

local BubbleButton =  import("app.weight.BubbleButton")

local Mushroom = class("Mushroom",function()
    return display.newScene("Mushroom")
end)

--[[一用到的方法MoveBy，ScaleTo ，RotateBy，使用API全在framework/shortcodes.lua文件中--]]
--[[一用到的方法MoveBy，ScaleTo ，RotateBy ，使用API全在framework/shortcodes.lua文件中--]]
--[[一用到的方法MoveBy，ScaleTo ，RotateBy ，使用API全在framework/shortcodes.lua文件中--]]
--[[一用到的方法MoveBy，ScaleTo ，RotateBy，使用API全在framework/shortcodes.lua文件中--]]

function Mushroom:ctor()



    --创建精灵背景
    self.bg=display.newSprite("image/login_bg.png")
    :pos(display.cx, display.cy)
    :addTo(self,-1)

  
   

   self.btn =cc.ui.UIPushButton.new({normal = "#mushroom1.png" , pressed = "#mushroom1.png"})
   :onButtonPressed(function()
        self.btn:setScale(1)
    end)
   :onButtonRelease(function()
        self.btn:setScale(1.5)
    end)
   :pos(display.cx/2,display.cy/3)
   :scale(1.5)
   :addTo(self.bg)
   --创建位移动画 p(x,y) 为坐标点 动画效果是两点间的移动，直接移动到那个坐标点
   local move1 =cc.MoveBy:create(0.5, cc.p(0, 50)) --显示效果上移50
   local move2 =cc.MoveBy:create(0.5, cc.p(0, -50)) --下移动50
   local move3 =cc.MoveBy:create(0.5, cc.p(50, 50))  --p(x,y) 为坐标点  
   local move4 =cc.MoveBy:create(0.5, cc.p(-50, -50)) 
   local move5 =cc.MoveBy:create(0.5, cc.p(-50, 50)) 
   local move6 =cc.MoveBy:create(0.5, cc.p(50, -50))
   local squenceAction1= cc.Sequence:create(move1,move2,move3,move4,move5,move6)
   transition.execute(self.btn, cc.RepeatForever:create(squenceAction1))




   	--添加一个自定义的按钮
    self.bubbleButton= BubbleButton.new({
       image = "#mushroom2.png",
        nil,
        prepare = function()
            
            self.bubbleButton:setButtonEnabled(false)
        end,
        listener = function()
         print("呵呵一下")
        end,
    })
    :pos(500,500)
    :scale(1.2)
    :addTo(self.bg)

     --创建位移动画 p(x,y) 为坐标点 动画效果是两点间的移动，直接移动到那个坐标点 p(x,y) 为坐标点 
   local move1 =cc.MoveBy:create(0.5, cc.p(0, 50)) --显示效果上移50
   local move2 =cc.MoveBy:create(0.5, cc.p(0, -50)) --下移动50
   local move3 =cc.MoveBy:create(0.5, cc.p(0,50))  
   local move4 =cc.MoveBy:create(0.5, cc.p(0, -50)) 
   local move5 =cc.MoveBy:create(0.5, cc.p(0, 50)) 
   local move6 =cc.MoveBy:create(0.5, cc.p(0, -50))
   local squenceAction2= cc.Sequence:create(move1,move2,move3,move4,move5,move6)
   transition.execute(self.bubbleButton, cc.RepeatForever:create(squenceAction2))
    --创建一个按钮

--模仿心跳动画
self.scaleBtn =cc.ui.UIPushButton.new({normal = "#mushroom3.png" , pressed = "#mushroom3.png"})
   :pos(display.cx+100,display.cy-100)
   :addTo(self.bg)

  local move1 =cc.ScaleTo:create(0.5,0.7) 
  local move2 =cc.ScaleTo:create(0.5,1.2) 
  local move3 =cc.ScaleTo:create(0.5,0.7) 
  local move4 =cc.ScaleTo:create(0.5,1.3) 
  local move5 =cc.ScaleTo:create(0.5,0.7) 
  local move6 =cc.ScaleTo:create(0.5,1.4) 
  local move7 =cc.ScaleTo:create(0.5,0.7) 
  local move8 =cc.ScaleTo:create(0.5,1.5) 
  local squenceAction3= cc.Sequence:create(move1,move2,move3,move4,move5,move6)
  transition.execute(self.scaleBtn, cc.RepeatForever:create(squenceAction3))



  --旋转动画
self.rotateByBtn =cc.ui.UIPushButton.new({normal = "#mushroom4.png" , pressed = "#mushroom4.png"})
   :onButtonPressed(function()
        self.rotateByBtn:setScale(0.7)
    end)
   :onButtonRelease(function()
        self.rotateByBtn:setScale(1.2)
    end)
   :pos(display.cx+200,display.cy-200)
   :addTo(self.bg)

  local move1 =cc.RotateBy:create(0.5,50) 
  -- local move2 =cc.RotateBy:create(0.5,20) 
  -- local move3 =cc.RotateBy:create(0.5,30) 
  -- local move4 =cc.RotateBy:create(0.5,40) 
  -- local move5 =cc.RotateBy:create(0.5,50) 
  -- local move6 =cc.RotateBy:create(0.5,60) 
  -- local move7 =cc.RotateBy:create(0.5,70) 
  -- local move8 =cc.RotateBy:create(0.5,80) 
  local squenceAction4= cc.Sequence:create(move1--[[,move2,move3,move4,move5,move6--]])
  transition.execute(self.rotateByBtn, cc.RepeatForever:create(squenceAction4))


 --多个动画
self.scaleByBtn =cc.ui.UIPushButton.new({normal = "#mushroom5.png" , pressed = "#mushroom5.png"})
   :onButtonPressed(function()
        self.scaleByBtn:pos(display.cx+300,display.cy+200)
    end)
   :onButtonRelease(function()
        
    end)
   :pos(display.cx+300,display.cy+200)
   :setScale(1.5)
   :addTo(self.bg)

  local move1 =cc.RotateBy:create(0.5,20) 
  local move2 =cc.ScaleBy:create(5,0.9) 
  local move3 =cc.MoveBy:create(0.5,cc.p(-10,-10)) 

  local squenceAction5= cc.Sequence:create(move1)
  local squenceAction6= cc.Sequence:create(move2)
  local squenceAction7= cc.Sequence:create(move3)
  transition.execute(self.scaleByBtn, cc.RepeatForever:create(squenceAction5)) 
  transition.execute(self.scaleByBtn, cc.RepeatForever:create(squenceAction6)) 
  transition.execute(self.scaleByBtn, cc.RepeatForever:create(squenceAction7))
end

function Mushroom:playBgMusic()
end

function Mushroom:onEnter()
end

function Mushroom:onExit()
end
return Mushroom

