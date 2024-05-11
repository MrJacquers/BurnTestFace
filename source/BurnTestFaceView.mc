import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BurnTestFaceView extends WatchUi.WatchFace {
  private var _settings;
  private var _bgColor;
  private var _lowPwrMode;

  function initialize() {
    WatchFace.initialize();
    _settings = new Settings();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {}

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {
    _lowPwrMode = false;
    //_settings.loadSettings();
    //_bgColor = _settings.colorCodes[_settings.colorNames.indexOf(_settings.bgColorName)];
  }

  // Update the view
  function onUpdate(dc as Dc) as Void {
    if (_lowPwrMode) {
      dc.setColor(0, 0);
      dc.clear();
      return;
    }

    _settings.loadSettings();
    _bgColor = _settings.colorCodes[_settings.colorNames.indexOf(_settings.bgColorName)];
    dc.setColor(0, _bgColor);
    dc.clear();
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}

  // The user has just looked at their watch. Timers and animations may be started here.
  function onExitSleep() as Void {
    _lowPwrMode = false;
  }

  // Terminate any active timers and prepare for slow updates.
  function onEnterSleep() as Void {
    _lowPwrMode = true;
  }
}
