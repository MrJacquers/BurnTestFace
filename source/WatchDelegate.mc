import Toybox.WatchUi;
import Toybox.Complications;

class WatchDelegate extends WatchFaceDelegate {
  function initialize() {
    WatchFaceDelegate.initialize();
  }

  public function onPress(clickEvent) {
    // cycle through colors
    var settings = new Settings();
    settings.loadSettings();

    var idx = settings.colorNames.indexOf(settings.bgColorName);
    idx = (idx + 1) % settings.colorNames.size();
    settings.setValue("BGColorName", settings.colorNames[idx]);

    return true;
  }
}
