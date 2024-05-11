import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class BurnTestFaceApp extends Application.AppBase {
  function initialize() {
    AppBase.initialize();
  }

  // onStart() is called on application start up
  function onStart(state as Dictionary?) as Void {}

  // onStop() is called when your application is exiting
  function onStop(state as Dictionary?) as Void {}

  // Return the initial view of your application here
  function getInitialView() as Array<Views or InputDelegates>? {
    return ([new BurnTestFaceView(), new WatchDelegate()] as Array<Views or InputDelegates>);
  }

  function getSettingsView() {
    //System.println("getSettingsView");
    return [new ODSettingsMenu(), new ODSettingsMenuDelegate()];
  }
}

function getApp() as BurnTestFaceApp {
  return Application.getApp() as BurnTestFaceApp;
}
