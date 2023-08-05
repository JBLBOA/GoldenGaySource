function onCreate()
    makeLuaSprite("wata", "bg/mickey/mickeyWatonFondo", -790, -230)
    scaleObject("wata", 1.9, 2.0)
    addLuaSprite("wata")
end
function onUpdate()
    if curStep == 255 then
        setProperty("wata.alpha", 1)
        doTweenAlpha("wataALPHA", "wata", 0.2, 1.5, "linear")
        setProperty('defaultCamZoom', 1.2)
        Light()
    elseif curStep == 511 then
        doTweenAlpha("wataALPHA", "wata", 1, 1.5, "linear")
        setProperty('defaultCamZoom', 0.9)
    end
end
function Light()
    makeLuaSprite("flash", "", 0, 0)
    makeGraphic("flash", 1500, 900, 'FFFFFF')
    setObjectCamera("flash", "Other")
    setProperty("flash.alpha", 1)
    addLuaSprite("flash")

    doTweenAlpha("flash", "flash", 0, 0.5, "")
end
