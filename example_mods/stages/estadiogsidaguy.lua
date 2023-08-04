function onCreate() 

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
	makeLuaSprite('back','bg/backrromgsida/back', -550,-580)
	scaleObject('back', 1.75, 1.75)
	updateHitbox('back')
	setProperty('back.antialiasing', false)
	addLuaSprite('back',false)
	close(true)

    makeLuaSprite('front','bg/backrromgsida/front', -550,-580)
    scaleObject('front', 1.75, 1.75)
    updateHitbox('front')
    setProperty('front.antialiasing', false)
    addLuaSprite('front',false)
    close(true)
    
    makeLuaSprite('piso','bg/backrromgsida/piso', -550,-580)
    scaleObject('piso', 1.75, 1.75)
    updateHitbox('piso')
    setProperty('piso.antialiasing', false)
    addLuaSprite('piso',false)
    close(true)

end