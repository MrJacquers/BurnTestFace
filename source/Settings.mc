import Toybox.Lang;
import Toybox.Application.Storage;

class Settings {
  var bgColorName;
  var colorNames = ["White", "Lt Gray", "Dk Gray", "Black", "Red", "Dk Red", "Orange", "Yellow", "Green", "Dk Green", "Blue","Dk Blue", "Purple", "Pink"];
  var colorCodes = [0xffffff, 0xaaaaaa, 0x555555, 0x000000, 0xff0000, 0xaa0000, 0xff5500, 0xffaa00, 0x00ff00, 0x00aa00, 0x00aaff, 0x0000ff, 0xaa00ff, 0xff00ff];

  function loadSettings() {
    // On-device settings, accessible via select watch face edit menu.
    if (Toybox.Application has :Storage) {
      bgColorName = getValue("BGColorName", "White");
    }
  }

  private function getValue(name, defaultValue) {
    var setting = Storage.getValue(name);
    if (setting != null) {
      return setting;
    } else {
      return defaultValue;
    }
  }

  function setValue(key, value) {
    Storage.setValue(key, value);
  }
}
