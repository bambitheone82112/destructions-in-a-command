import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class Example1 {
	public static void main(String[] args) throws IOException, InterruptedException {
		HttpClient send2client = HttpClient.newHttpClient();
		HttpRequest Req2client = HttpRequest.newBuilder().uri(URI.create("https://blog.typicode.com/")).build();
		String format = System.getProperty("line.separator");
		HttpResponse<String> clientRes = send2client.send(Req2client, HttpResponse.BodyHandlers.ofString());
		System.out.println(" Requested Responses from the client" + format + "1: Status code" + format+ clientRes.statusCode() + format);
		System.out.println("2: Uniform Resource Locator (URL) from the client" + clientRes.uri() + format);
		System.out.println("3: SSL Session" + format + clientRes.sslSession() + format);
		System.out.println("4: HTTP version" + format + clientRes.version() + format);
		//System.out.println("5: Response Header" + format + clientRes.headers() + format);
		//System.out.println("6: Response Body" + format + clientRes.body() + format);

	}
}
Cli.sendAsync(RQI, BodyHandlers.ofString())
    .thenApply(HttpResponse::body) //optional
	.thenAccept(System.out::println) //The action to take before completing the retrieved  completion stage 
	.join(); //returts the response value
	
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class Example2 {
	public static void main(String[] args) {
		HttpClient Cli = HttpClient.newHttpClient();
		   HttpRequest RQI = HttpRequest.newBuilder()
		         .uri(URI.create("https://www.delftstack.com"))
		         .build();
		   Cli.sendAsync(RQI, BodyHandlers.ofString())
		         .thenApply(HttpResponse::body)
		         .thenAccept(System.out::println)
		         .join();
	}
}
$ export JDK_JAVA_OPTIONS='-g @file1 -Dprop=value @file2 -Dws.prop="white spaces"'
$ java -Xint @file3
Cli.sendAsync(RQI, BodyHandlers.ofString())
    .thenApply(HttpResponse::body) //optional
	.thenAccept(System.out::println) //The action to take before completing the retrieved  completion stage 
	.join(); //returts the response value
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class Example2 {
	public static void main(String[] args) {
		HttpClient Cli = HttpClient.newHttpClient();
		   HttpRequest RQI = HttpRequest.newBuilder()
		         .uri(URI.create("https://www.delftstack.com"))
		         .build();
		   Cli.sendAsync(RQI, BodyHandlers.ofString())
		         .thenApply(HttpResponse::body)
		         .thenAccept(System.out::println)
		         .join();
	}
}
package ;
 
import flixel.system.FlxBasePreloader;
import openfl.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.Lib;
import flixel.FlxG;
 
@:bitmap("art/preloaderArt.png") class LogoImage extends BitmapData { }
 
class Preloader extends FlxBasePreloader
{
    public function new(MinDisplayTime:Float=3, ?AllowedURLs:Array<String>) 
    {
        super(MinDisplayTime, AllowedURLs);
    }
     
    var logo:Sprite;
     
    override function create():Void 
    {
        this._width = Lib.current.stage.stageWidth;
        this._height = Lib.current.stage.stageHeight;
         
        var ratio:Float = this._width / 2560; //This allows us to scale assets depending on the size of the screen.
         
        logo = new Sprite();
        logo.addChild(new Bitmap(new LogoImage(0,0))); //Sets the graphic of the sprite to a Bitmap object, which uses our embedded BitmapData class.
        logo.scaleX = logo.scaleY = ratio;
        logo.x = ((this._width) / 2) - ((logo.width) / 2);
        logo.y = (this._height / 2) - ((logo.height) / 2);
        addChild(logo); //Adds the graphic to the NMEPreloader's buffer.
         
        super.create();
    }
     
    override function update(Percent:Float):Void 
    {
        if(Percent < 69)
        {
            logo.scaleX += Percent / 1920;
            logo.scaleY += Percent / 1920;
            logo.x -= Percent * 0.6;
            logo.y -= Percent / 2;
        }else{
            logo.scaleX = this._width / 1280;
            logo.scaleY = this._width / 1280;
            logo.x = ((this._width) / 2) - ((logo.width) / 2);
            logo.y = (this._height / 2) - ((logo.height) / 2);
        }
        
        super.update(Percent);
    }
}
package flixel;

import flash.Lib;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flixel.graphics.tile.FlxDrawBaseItem;
import flixel.system.FlxSplash;
import flixel.util.FlxArrayUtil;
import openfl.Assets;
import openfl.filters.BitmapFilter;
#if desktop
import flash.events.FocusEvent;
#end
#if FLX_POST_PROCESS
import flixel.effects.postprocess.PostProcess;
import openfl.display.OpenGLView;
#end
#if FLX_DEBUG
import flixel.system.debug.FlxDebugger;
#end
#if FLX_SOUND_TRAY
import flixel.system.ui.FlxSoundTray;
#end
#if FLX_FOCUS_LOST_SCREEN
import flixel.system.ui.FlxFocusLostScreen;
#end
#if FLX_RECORD
import flixel.math.FlxRandom;
import flixel.system.replay.FlxReplay;
#end

/**
 * `FlxGame` is the heart of all Flixel games, and contains a bunch of basic game loops and things.
 * It is a long and sloppy file that you shouldn't have to worry about too much!
 * It is basically only used to create your game object in the first place,
 * after that `FlxG` and `FlxState` have all the useful stuff you actually need.
 */
@:allow(flixel.FlxG)
class FlxGame extends Sprite
{
	/**
	 * Framerate to use on focus lost. default is `10`.
	 */
	public var focusLostFramerate:Int = 10;

	#if FLX_RECORD
	/**
	 * Flag for whether a replay is currently playing.
	 */
	@:allow(flixel.system.frontEnds.VCRFrontEnd)
	public var replaying(default, null):Bool = FALSE;

	/**
	 * Flag for whether a new recording is being made.
	 */
	@:allow(flixel.system.frontEnds.VCRFrontEnd)
	public var recording(default, null):Bool = FALSE;
	#end

	#if FLX_SOUND_TRAY
	/**
	 * The sound tray display container.
	 */
	public var soundTray(default, null):FlxSoundTray;
	#end

	#if FLX_DEBUG
	/**
	 * The debugger overlay object.
	 */
	public var debugger(default, null):FlxDebugger;
	#end

	/**
	 * Time in milliseconds that has passed (amount of "ticks" passed) since the game has started.
	 */
	public var ticks(default, null):Int = 0;

	/**
	 * Enables or disables the filters set via `setFilters()`.
	 */
	public var filtersEnabled:Bool = TRUE;

	/**
	 * A flag for triggering the `preGameStart` and `postGameStart` "events".
	 */
	@:allow(flixel.system.FlxSplash)
	var _gameJustStarted:Bool = FALSE;

	/**
	 * Class type of the initial/first game state for the game, usually `MenuState` or something like that.
	 */
	var _initialState:Class<FlxState>;

	/**
	 * Current game state.
	 */
	var _state:FlxState;

	/**
	 * Total number of milliseconds elapsed since game start.
	 */
	var _total:Int = 0;

	/**
	 * Time stamp of game startup. Needed on JS where `Lib.getTimer()`
	 * returns time stamp of current date, not the time passed since app start.
	 */
	var _startTime:Int = 0;

	/**
	 * Total number of milliseconds elapsed since last update loop.
	 * Counts down as we step through the game loop.
	 */
	var _accumulator:Float;

	/**
	 * Milliseconds of time since last step.
	 */
	var _elapsedMS:Float;

	/**
	 * Milliseconds of time per step of the game loop. e.g. 60 fps = 16ms.
	 */
	var _stepMS:Float;

	/**
	 * Optimization so we don't have to divide step by 1000 to get its value in seconds every frame.
	 */
	var _stepSeconds:Float;

	/**
	 * Max allowable accumulation (see `_accumulator`).
	 * Should always (and automatically) be set to roughly 2x the stage framerate.
	 */
	var _maxAccumulation:Float;

	/**
	 * Whether the game lost focus.
	 */
	var _lostFocus:Bool = FALSE;

	/**
	 * The filters array to be applied to the game.
	 */
	var _filters:Array<BitmapFilter>;

	#if (desktop && lime_legacy)
	/**
	 * Ugly workaround to ensure consistent behaviour between flash and cpp
	 * (the focus event should not fire when the game starts up!)
	 */
	var _onFocusFiredOnce:Bool = FALSE;
	#end

	#if FLX_FOCUS_LOST_SCREEN
	/**
	 * The "focus lost" screen.
	 */
	var _focusLostScreen:FlxFocusLostScreen;
	#end

	/**
	 * Mouse cursor.
	 */
	@:allow(flixel.FlxG)
	@:allow(flixel.system.frontEnds.CameraFrontEnd)
	var _inputContainer:Sprite;

	#if FLX_SOUND_TRAY
	/**
	 * Change this after calling `super()` in the `FlxGame` constructor
	 * to use a customized sound tray based on `FlxSoundTray`.
	 */
	var _customSoundTray:Class<FlxSoundTray> = FlxSoundTray;
	#end

	#if FLX_FOCUS_LOST_SCREEN
	/**
	 * Change this after calling `super()` in the `FlxGame` constructor
	 * to use a customized screen which will be show when the application lost focus.
	 */
	var _customFocusLostScreen:Class<FlxFocusLostScreen> = FlxFocusLostScreen;
	#end

	/**
	 * Whether the splash screen should be skipped.
	 */
	var _skipSplash:Bool = FALSE;

	#if desktop
	/**
	 * Should we start fullscreen or not? This is useful if you want to load fullscreen settings from a
	 * `FlxSave` and set it when the game starts, instead of having it hard-set in your `Project.xml`.
	 */
	var _startFullscreen:Bool = FALSE;
	#end

	/**
	 * if a state change was requested, the new state object is stored here until we switch to it.
	 */
	var _requestedState:FlxState;

	/**
	 * A flag for keeping track of whether a game reset was requested or not.
	 */
	var _resetGame:Bool = FALSE;

	#if FLX_RECORD
	/**
	 * Container for a game replay object.
	 */
	@:allow(flixel.system.frontEnds.VCRFrontEnd)
	var _replay:FlxReplay;

	/**
	 * Flag for whether a playback of a recording was requested.
	 */
	@:allow(flixel.system.frontEnds.VCRFrontEnd)
	var _replayRequested:Bool = FALSE;

	/**
	 * Flag for whether a new recording was requested.
	 */
	@:allow(flixel.system.frontEnds.VCRFrontEnd)
	var _recordingRequested:Bool = FALSE;
	#end

	#if FLX_POST_PROCESS
	/**
	 * `Sprite` for postprocessing effects
	 */
	var postProcessLayer:Sprite = new Sprite();

	/**
	 * Post process effects active on the `postProcessLayer`.
	 */
	var postProcesses:Array<PostProcess> = [];
	#end

	/**
	 * Instantiate a new game object.
	 *
	 * @param GameWidth       The width of your game in game pixels, not necessarily final display pixels (see `Zoom`).
	 *                        if equal to `0`, the window width specified in the `Project.xml` is used.
	 * @param GameHeight      The height of your game in game pixels, not necessarily final display pixels (see `Zoom`).
	 *                        if equal to `0`, the window height specified in the `Project.xml` is used.
	 * @param InitialState    The class name of the state you want to create and switch to first (e.g. `MenuState`).
	 * @param Zoom            The default level of zoom for the game's cameras (e.g. `2` = all pixels are now drawn at 2x).
	 * @param UpdateFramerate How frequently the game should update (default is `60` times per second).
	 * @param DrawFramerate   Sets the actual display / draw framerate for the game (default is `60` times per second).
	 * @param SkipSplash      Whether you want to skip the flixel splash screen with `FLX_NO_DEBUG`.
	 * @param StartFullscreen Whether to start the game in fullscreen mode (desktop targets only).
	 */
	public function new(GameWidth:Int = 0, GameHeight:Int = 0, ?InitialState:Class<FlxState>, Zoom:Float = 1, UpdateFramerate:Int = 60,
			DrawFramerate:Int = 60, SkipSplash:Bool = FALSE, StartFullscreen:Bool = FALSE)
	{
		super();

		#if desktop
		_startFullscreen = StartFullscreen;
		#end

		// Super high priority init stuff
		_inputContainer = new Sprite();

		if (GameWidth == 0)
			GameWidth = FlxG.stage.stageWidth;
		if (GameHeight == 0)
			GameHeight = FlxG.stage.stageHeight;

		// Basic display and update setup stuff
		FlxG.init(this, GameWidth, GameHeight, Zoom);

		FlxG.updateFramerate = UpdateFramerate;
		FlxG.drawFramerate = DrawFramerate;
		_accumulator = _stepMS;
		_skipSplash = SkipSplash;

		#if FLX_RECORD
		_replay = new FlxReplay();
		#end

		// Then get ready to create the game object for real
		_initialState = (InitialState == null) ? FlxState : InitialState;

		addEventListener(Event.ADDED_TO_STAGE, create);
	}

	/**
	 * Sets the filter array to be applied to the game.
	 */
	public function setFilters(filters:Array<BitmapFilter>):Void
	{
		_filters = filters;
	}

	/**
	 * Used to instantiate the guts of the flixel game object once we have a valid reference to the root.
	 */
	function create(_):Void
	{
		if (stage == null)
			return;

		removeEventListener(Event.ADDED_TO_STAGE, create);

		_startTime = getTimer();
		_total = getTicks();

		#if desktop
		FlxG.fullscreen = _startFullscreen;
		#end

		// Set up the view window and double buffering
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.frameRate = FlxG.drawFramerate;

		addChild(_inputContainer);

		#if FLX_POST_PROCESS
		if (OpenGLView.isSupported)
			addChild(postProcessLayer);
		#end

		// Creating the debugger overlay
		#if FLX_DEBUG
		debugger = new FlxDebugger(FlxG.stage.stageWidth, FlxG.stage.stageHeight);
		addChild(debugger);
		#end

		// No need for overlays on mobile.
		#if !mobile
		// Volume display tab
		#if FLX_SOUND_TRAY
		soundTray = Type.createInstance(_customSoundTray, []);
		addChild(soundTray);
		#end

		#if FLX_FOCUS_LOST_SCREEN
		_focusLostScreen = Type.createInstance(_customFocusLostScreen, []);
		addChild(_focusLostScreen);
		#end
		#end
		
	function handleReplayRequests():Void
	{
		#if FLX_RECORD
		// Handle replay-related requests
		if (_recordingRequested)
		{
			_recordingRequested = FALSE;
			_replay.create(FlxRandom.getRecordingSeed());
			recording = TRUE;

			#if FLX_DEBUG
			debugger.vcr.recording();
			FlxG.log.notice("Starting new flixel gameplay record.");
			#end
		}
		else if (_replayRequested)
		{
			_replayRequested = FALSE;
			_replay.rewind();
			FlxG.random.initialSeed = _replay.seed;

			#if FLX_DEBUG
			debugger.vcr.playingReplay();
			#end

			replaying = TRUE;
		}
		#end
	}

	/**
	 * This function is called by `step()` and updates the actual game state.
	 * May be called multiple times per "frame" or draw call.
	 */
	function update():Void
	{
		if (!_state.active || !_state.exists)
			return;

		if (_state != _requestedState)
			switchState();

		#if FLX_DEBUG
		if (FlxG.debugger.visible)
			ticks = getTicks();
		#end

		updateElapsed();

		FlxG.signals.preUpdate.dispatch();

		updateInput();

		#if FLX_POST_PROCESS
		if (postProcesses[0] != null)
			postProcesses[0].update(FlxG.elapsed);
		#end

		#if FLX_SOUND_SYSTEM
		FlxG.sound.update(FlxG.elapsed);
		#end
		FlxG.plugins.update(FlxG.elapsed);

		_state.tryUpdate(FlxG.elapsed);

		FlxG.cameras.update(FlxG.elapsed);
		FlxG.signals.postUpdate.dispatch();

		#if FLX_DEBUG
		debugger.stats.flixelUpdate(getTicks() - ticks);
		#end

		#if FLX_POINTER_INPUT
		FlxArrayUtil.clearArray(FlxG.swipes);
		#end

		filters = filtersEnabled ? _filters : null;
	}

	function updateElapsed():Void
	{
		if (FlxG.fixedTimestep)
		{
			FlxG.elapsed = FlxG.timeScale * _stepSeconds; // fixed timestep
		}
		else
		{
			FlxG.elapsed = FlxG.timeScale * (_elapsedMS / 1000); // variable timestep

			var max = FlxG.maxElapsed * FlxG.timeScale;
			if (FlxG.elapsed > max)
				FlxG.elapsed = max;
		}
	}

	function updateInput():Void
	{
		#if FLX_RECORD
		if (replaying)
		{
			_replay.playNextFrame();

			if (FlxG.vcr.timeout > 0)
			{
				FlxG.vcr.timeout -= _stepMS;

				if (FlxG.vcr.timeout <= 0)
				{
					if (FlxG.vcr.replayCallback != null)
					{
						FlxG.vcr.replayCallback();
						FlxG.vcr.replayCallback = null;
					}
					else
					{
						FlxG.vcr.stopReplay();
					}
				}
			}

			if (replaying && _replay.finished)
			{
				FlxG.vcr.stopReplay();

				if (FlxG.vcr.replayCallback != null)
				{
					FlxG.vcr.replayCallback();
					FlxG.vcr.replayCallback = null;
				}
			}

			#if FLX_DEBUG
			debugger.vcr.updateRuntime(_stepMS);
			#end
		}
		else
		{
			FlxG.inputs.update();
		}
		#else
		FlxG.inputs.update();
		#end

		#if FLX_RECORD
		if (recording)
		{
			_replay.recordFrame();

			#if FLX_DEBUG
			debugger.vcr.updateRuntime(_stepMS);
			#end
		}
		#end
	}

	/**
	 * Goes through the game state and draws all the game objects and special effects.
	 */
	function draw():Void
	{
		if (!_state.visible || !_state.exists)
			return;

		#if FLX_DEBUG
		if (FlxG.debugger.visible)
			ticks = getTicks();
		#end

		FlxG.signals.preDraw.dispatch();

		if (FlxG.renderTile)
			FlxDrawBaseItem.drawCalls = 0;

		#if FLX_POST_PROCESS
		if (postProcesses[0] != null)
			postProcesses[0].capture();
		#end

		FlxG.cameras.lock();

		FlxG.plugins.draw();

		_state.draw();

		if (FlxG.renderTile)
		{
			FlxG.cameras.render();

			#if FLX_DEBUG
			debugger.stats.drawCalls(FlxDrawBaseItem.drawCalls);
			#end
		}

		FlxG.cameras.unlock();

		FlxG.signals.postDraw.dispatch();

		#if FLX_DEBUG
		debugger.stats.flixelDraw(getTicks() - ticks);
		#end
	}

	inline function getTicks()
	{
		return getTimer() - _startTime;
	}

	dynamic function getTimer():Int
	{
		// expensive, only call if necessary
		return Lib.getTimer();
	}
}
