
local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)


function GameScene:ctor()

	 --创建精灵背景
    self.bg=display.newSprite("image/login_bg.png")
    :pos(display.cx, display.cy)
    :addTo(self,-1)

    local size = cc.Director:getInstance():getVisibleSize()
    local orign = cc.Director:getInstance():getVisibleOrigin()
    local backBtn = ccui.Button:create("image/mushroom7.png")
    backBtn:setPosition(cc.p(orign.x + size.width/2, orign.y + size.height/2))
    backBtn:setAnchorPoint(cc.p(1,0))
    local function callback(ref, type)
        if type == ccui.TouchEventType.ended then
          print("退出")
        app:enterMushroom()
        end
    end
    backBtn:addTouchEventListener(callback)
    self:addChild(backBtn)
 
    self.schedulerID = nil
    self.count = 0
    self.isTouch = false
    self.longPress = false
    self.isMoved = false

    local size = cc.Director:getInstance():getVisibleSize()
    local orign = cc.Director:getInstance():getVisibleOrigin() 
    local btn = ccui.Button:create("image/mushroom7.png")
    btn:setPosition(cc.p(orign.x + size.width/2, orign.y + size.height/2))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    self:addChild(btn)
    btn:setScale(0.5)
    -- local image =display.newSprite("#mushroom7.png")
    -- btn:addChild(image)  

   
    local function beginhandle()
        if self.isTouch then
            self.count = self.count + 1
            if self.count >= 2 then
                self.longPress = true
                self.count = 0
                print("long press handle")
            end
        end
    end
   
    local function singleClick()
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.oneHandle)   
        self.count = 0
        print("single click handle")
        self:startemoji(800,500)
    end
   
    local function doubleClick()
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.twoHandle)
        self.count = 0
        print("double click handle")
          self:startemoji(100,500)
    end
   
    local function threeClick()
        self.count = 0
     print("tree click handle")
    self:startemoji(800,100)
    end
   
    local function eventTouch(ref, type)
        if ref == btn then
            if type == ccui.TouchEventType.began then
                self.isTouch = true
                self.beginHandle = cc.Director:getInstance():getScheduler():scheduleScriptFunc(beginhandle,1,false)    
           
            elseif type == ccui.TouchEventType.moved then
                self.isMoved = true
               
            elseif type == ccui.TouchEventType.ended then
                cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.beginHandle)
                self.isTouch = false
                if self.longPress then
                    self.longPress = false
                    self.count = 0
                    return false
                end
                if self.isMoved then
                 self.isMoved = false
                 return false
                end
                if self.count == 2 then
                 threeClick()
                 self.count = 0
                    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.oneHandle)
                    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.twoHandle)
                   
                elseif self.count == 1 then
                    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.oneHandle)
                    self.twoHandle = cc.Director:getInstance():getScheduler():scheduleScriptFunc(doubleClick,0.25,false)
                    self.count = self.count + 1
                elseif self.count == 0 then
                    self.oneHandle = cc.Director:getInstance():getScheduler():scheduleScriptFunc(singleClick,0.25,false)
                    self.count = self.count + 1
                end       
            end
        end
    end
    btn:addTouchEventListener(eventTouch)


end
function GameScene:playBgMusic()
end

function GameScene:startemoji(x,y)
            if self.animate then
                return
            end

            self.animate = display.newSprite("image/mushroom7.png")
            self.animate:align(display.LEFT_BOTTOM, 20, 130)
            self.animate:addTo(self,1000)

            --加载等待动画帧 
            local frames = display.newFrames("mushroom%d.png", 1,7)
            local animation = display.newAnimation(frames, 1 / 7)
            local ani = cc.Animate:create(animation)

            local function anim()
                self.animate:removeSelf()
                self.animate = nil
            end

            local callfun = cc.CallFunc:create(anim) 
            local moveto = cc.MoveTo:create(0.1, cc.p(x, y))
            local action = cc.Sequence:create(moveto,ani,callfun)  
            self.animate:runAction(action)

end

return GameScene