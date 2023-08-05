function onUpdate()
	if dadName == "GoldenGuy-alt" then
		if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
			setProperty('iconP2.angle', -50)
			setProperty('iconP2.y', 550)
		elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
			setProperty('iconP2.angle', 50)
			setProperty('iconP2.y', 550)
		elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
			setProperty('iconP2.angle', 0)
			setProperty('iconP2.y', 530)
		elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
			setProperty('iconP2.angle', 0)
			setProperty('iconP2.y', 600)
		elseif getProperty('dad.animation.curAnim.name') == 'idle' then
			setProperty('iconP2.angle', 0)
			setProperty('iconP2.y', 550)
	end
end
end