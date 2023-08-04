package states;

#if desktop
import backend.Discord.DiscordClient;
#end
import states.editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import openfl.filters.ShaderFilter;
import backend.WeekData;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.system.FlxAssets;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FreeplaySaves
{
    public static var goluy:String = 'locked';

    public static function fuckinSet() {
        if (FlxG.save.data.goluy == null) FlxG.save.data.goluy = 'locked';
        FlxG.save.flush();
    }

    public static function saveShit() {
        FlxG.save.data.goluy = goluy;
        FlxG.save.flush();
    }

    public static function loadShit() { //golly gee willikers
        goluy = FlxG.save.data.goluy;
        /*if (lurkingLock == 'beaten' && loreLock == 'beaten' && blubberLock == 'beaten' && goldenLock == 'beaten' && performanceLock == 'beaten' && trappedLock == 'beaten' && biteLock == 'beaten' && gofishLock == 'beaten' && watchfulLock == 'beaten' && restlessLock == 'beaten' && beatboxLock == 'beaten' && showtimeLock == 'beaten' && manLock == 'beaten' && followedLock == 'beaten' && fazfuckLock == 'beaten' && criminalLock == 'beaten') FlxG.save.data.millerHere = true;*/
        FlxG.save.flush();
    }
}