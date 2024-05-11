import Toybox.Lang;
import Toybox.WatchUi;

// https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/Menu2InputDelegate.html
class ODSettingsMenuDelegate extends WatchUi.Menu2InputDelegate {
  function initialize() {
    Menu2InputDelegate.initialize();
  }

  function onSelect(item) {
    if (item.getId().equals("BGColor")) {
      var settings = new Settings();
      settings.loadSettings();

      // cycle through colors
      var idx = settings.colorNames.indexOf(settings.bgColorName);
      idx = (idx + 1) % 14;
      item.setSubLabel(settings.colorNames[idx]);
      settings.setValue("BGColorName", settings.colorNames[idx]);
    }
  }

  function onBack() {
    WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
  }
}
