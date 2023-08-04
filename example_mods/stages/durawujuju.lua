function onCreate()

    makeLuaSprite('dura','bg/dura/DuraBoxBG', -790, -450)
    scaleObject("dura", 1.5, 1.3)

    makeAnimatedLuaSprite("Aycarbon", 'bg/dura/AyCabronDance', -400, 10)
    makeLuaSprite('micro','bg/dura/ElMicro', -300, -470)

    --cuando yo la vi WUJUJU!
    addLuaSprite("dura")
    addLuaSprite("Aycarbon")
    addLuaSprite("micro")
end
function onBeatHit()
    addAnimationByPrefix("Aycarbon", "Aycarbon", "danceCabron", 24, false)
end
function onCountdownTick()
    addAnimationByPrefix("Aycarbon", "Aycarbon", "danceCabron", 24, false)
end