import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class LoggerekApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        Communications.registerForPhoneAppMessages(method(:phoneMessageCallback));
        System.print("DUPA");
    }

   function phoneMessageCallback(msg as Toybox.Communications.PhoneAppMessage) as Void {
      System.println(msg.data);
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void
     {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new LoggerekView(), new LoggerekDelegate() ];
    }

}

function getApp() as LoggerekApp {
    return Application.getApp() as LoggerekApp;
}