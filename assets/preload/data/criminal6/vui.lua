-- WARNING: When using this script, some of your saves might ovveride to keep the effect of the vanilla aesthetic go smooth.

-- PSYCH ENGINE: VANILLA RESKIN VIA. LUA --
-- CREDITS:
-- @cyn#5661 - Original Custom Healthbar Script (https://discord.com/channels/922849922175340586/922851578996744252/941509137601269800)
-- @Stilic#5989 - Combo popup on the counter (was too lazy to make one LMAOOO) (https://cdn.discordapp.com/attachments/922851578996744252/974003348158185523/noteComboPack.zip)
-- @BombasticTom#0084 - Scripting the script
-- ninja_muffin99 - Reference Code :nerd:

local preferences = { -- A guide for preferences.
	comboCamGame = false, -- if you want to see combo counter on camGame
	vanillaStrumPos = false, -- if you want the strums to position just like in vanilla (setting this to false also enables the strums to play animation on opponent strums)
	comboSprite = false, -- makes the combo text show
	prototypeText = false, -- if you want the prototype text to appear (set to true)
	vanillaCountFrom10 = true, -- if you want the combo number to show up after 10 combo (just like in vanilla) (set this to false in order to show numbers from start)
	vanillaHB = true, -- Want the vanilla healthbar colors?
	fpsVisible = false -- Wanna see your framerate?
}

local count = 0
local playerSettings = { -- DON'T MESS WITH THIS, YOU MIGHT BREAK SOMETHING :D
	['hideHud'] = {false, true},
	['ghostTapping'] = {true, true}
}
function onEvent(n, v1, v2)
	if n == 'Change Character' then
		if preferences.vanillaHB then setHealthBarColors('FF0000', '66FF33') end
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
	end
end

function onDestroy()
	for setting, option in pairs(playerSettings) do
		setPropertyFromClass('ClientPrefs', setting, option[1]);
	end
end

function onCountdownTick(count)
	if count == 0 then
		fixStrumPosition();
	end
end

function onUpdatePost(elapsed)

	setHealthBarColors("FF0000", "00FF00")
	
	local playbackRate = getProperty('playbackRate')
	if playbackRate == 'playbackRate' then
		playbackRate = 1 -- MAN WHAT ARE YOU DOING? UPDATE TO 0.6.3 ALREADY BRUH
	end
 
	for i=0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -28);
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -18);
	end

	setGraphicSize('luaIconP1', math.floor(math.lerp(150, getProperty('luaIconP1.width'), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))))
	setGraphicSize('luaIconP2', math.floor(math.lerp(150, getProperty('luaIconP2.width'), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))))

	updateHitbox('luaIconP1')
	updateHitbox('luaIconP2')

	setProperty('luaIconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (math.remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01) - 26))
	setProperty('luaIconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * (math.remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) - (getProperty('luaIconP2.width') - 26))

	if getProperty('healthBar.percent') < 20 then
		setProperty('luaIconP1.animation.curAnim.curFrame', 1)
	else
		setProperty('luaIconP1.animation.curAnim.curFrame', 0)
	end

	if getProperty('healthBar.percent') > 80 then
		setProperty('luaIconP2.animation.curAnim.curFrame', 1)
	else
		setProperty('luaIconP2.animation.curAnim.curFrame', 0)
	end
end

function onBeatHit()
	setGraphicSize('luaIconP1', math.floor(getProperty('luaIconP1.width') + 30))
	setGraphicSize('luaIconP2', math.floor(getProperty('luaIconP2.width') + 30))

	updateHitbox('luaIconP1')
	updateHitbox('luaIconP2')
end

function onUpdateScore()
	setTextString('luaScoreTxt', 'Score:'..score);
end

function opponentNoteHit(id, noteData)
	runHaxeCode([[game.opponentStrums.members[]]..noteData..[[].playAnim('static', true)]]);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)

	if not isSustainNote then
		if getProperty('cpuControlled') then
			addScore(350)
		end
		if preferences.comboCamGame then
			popUpScore(id)
		end
	end
end
function onCreatePost()
	setPropertyFromClass('Main', 'fpsVar.visible', preferences.fpsVisible)
	makeLuaText('luaScoreTxt', 'DEATGS:0', 0, 800,670);
	setObjectCamera("luaScoreTxt", "hud")
	setTextSize('luaScoreTxt', 18);
	setTextBorder('luaScoreTxt', 1, '000000');
	addLuaText('luaScoreTxt');
end
function onUpdateScore()
	setTextString('luaScoreTxt', 'DEATGS:'..misses);
end