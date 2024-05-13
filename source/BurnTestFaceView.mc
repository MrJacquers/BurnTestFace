import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BurnTestFaceView extends WatchUi.WatchFace {
  private var _settings;
  private var _lowPwrMode;
  private var colors = [Graphics.COLOR_WHITE, Graphics.COLOR_LT_GRAY, Graphics.COLOR_DK_GRAY, Graphics.COLOR_RED, Graphics.COLOR_DK_RED, Graphics.COLOR_ORANGE, Graphics.COLOR_YELLOW,
    Graphics.COLOR_GREEN, Graphics.COLOR_DK_GREEN, Graphics.COLOR_BLUE, Graphics.COLOR_DK_BLUE, Graphics.COLOR_PURPLE, Graphics.COLOR_PINK];
  private var _screenWidth;
  private var _screenHeight;

  function initialize() {
    WatchFace.initialize();
    _settings = new Settings();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    _screenWidth = dc.getWidth();
    _screenHeight = dc.getHeight();
  }

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

    if (_settings.bgColorName.equals("Test H") || _settings.bgColorName.equals("Test V")) {
      drawTestPattern(dc, _settings.bgColorName.equals("Test H"));
      return;
    }

    var idx = _settings.colorNames.indexOf(_settings.bgColorName);
    if (idx > -1) {
      dc.setColor(0, _settings.colorCodes[idx]);
      dc.clear();
    } else {
      System.println("Error getting index for " + _settings.bgColorName);
      dc.setColor(Graphics.COLOR_DK_GRAY, 0);
      dc.drawText(_screenWidth / 2, _screenHeight / 2, Graphics.FONT_MEDIUM, "Error", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
  }

  function drawTestPattern(dc, horizontal) {
    dc.setColor(0, 0);
    dc.clear();

    var pos = 0;
    var gapSize = 2;
    var colorSize = colors.size();
    var barSize = ((horizontal ? _screenHeight : _screenWidth) - colorSize * gapSize) / colorSize;

    for (var i = 0; i < colorSize; i++) {
      dc.setColor(colors[i], 0);

      if (horizontal) {
        dc.fillRectangle(0, pos, _screenWidth, barSize);
      } else {
        dc.fillRectangle(pos, 0, barSize, _screenHeight);
      }

      pos += barSize + gapSize;
    }
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
