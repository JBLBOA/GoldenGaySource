function onCreate()
    makeLuaSprite('criminal6','bg/criminal6/criminal', -850, 0)
    scaleObject("criminal6", 2.5, 1.5)
    addLuaSprite('criminal6',false)

    makeLuaSprite("fred", "bg/criminal6/fredad-destroyed", -850, 0)
    scaleObject("fred", 2.5, 1.5)

    makeLuaSprite("fopico", "bg/criminal6/fopico-destroyed", -850, 0)
    scaleObject("fopico", 2.5, 1.5)
    
    makeLuaSprite("bonifriend", "bg/criminal6/bonifriend-destroted", -850, 0)
    scaleObject("bonifriend", 2.5, 1.5)

    makeLuaSprite("incendio", "", 0, 0)
    makeGraphic("incendio", 1500, 900, 'FF5A20')
    setObjectCamera("incendio", "Other")
    setProperty("incendio.alpha", 0.5)

    makeAnimatedLuaSprite("Fire", "bg/criminal6/fuego", -750, 350)
    scaleObject("Fire", 2.8, 1.5)

    makeLuaText("150°", "150°", 0, 1180,670)
    setObjectCamera("150°", "Other")
    setTextSize("150°", 40)
    setTextColor("150°", "FF0000")
end
function onUpdate()
    if curStep == 1680 then
        addLuaSprite("fred")
        Light()
    elseif curStep == 1695 then
        addLuaSprite("fopico")
        Light()
    elseif curStep == 1711 then
        addLuaSprite("bonifriend")
        Light()
    elseif curStep == 1728 then
        addLuaSprite("Fire",true)
        --hud
        addLuaSprite("incendio",true)
        addLuaText("150°")
        Light()
    end
end
function onBeatHit()
    addAnimationByPrefix("Fire", "Fire", "fuego", 24, false)
end
function Light()
    makeLuaSprite("flash", "", 0, 0)
    makeGraphic("flash", 1500, 900, 'FFFFFF')
    setObjectCamera("flash", "Other")
    setProperty("flash.alpha", 1)
    addLuaSprite("flash")

    doTweenAlpha("flash", "flash", 0, 0.5, "")
end
