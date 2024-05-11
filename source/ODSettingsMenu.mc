import Toybox.Lang;
import Toybox.WatchUi;

// https://developer.garmin.com/connect-iq/core-topics/native-controls/
class ODSettingsMenu extends WatchUi.Menu2 {
  function initialize() {
    // https://forums.garmin.com/developer/connect-iq/f/discussion/264671/menu2-multiple-options-select-item
    // https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/CustomMenu.html

    var settings = new Settings();
    settings.loadSettings();

    Menu2.initialize(null);
    Menu2.setTitle("Settings");

    Menu2.addItem(
      new WatchUi.MenuItem(
        "Background Color",
        settings.bgColorName,
        "BGColor",
        {}
      )
    );
  }
}
