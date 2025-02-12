import Toybox.WatchUi;

class CacheLegacyMenuDelegate extends WatchUi.MenuInputDelegate {

    var logArray;
    var cacheArray;

    function initialize(logs, caches) {
        logArray = logs;
        cacheArray = caches;
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        for( var i = 0; i < cacheArray.size(); i++){
            if(cacheArray[i]["cacheId"] == item){
                System.print("Cache found: " + cacheArray[i]["title"]);
                var menu = new WatchUi.Menu();
                var delegate;
                menu.setTitle(cacheArray[i]["title"]);
                for( var j = 0; j < logArray.size(); j++){
                    menu.addItem(logArray[j]["text"], logArray[j]["logId"]);
                }
                WatchUi.popView(WatchUi.SLIDE_UP);
                WatchUi.pushView(menu, new LogLegacyMenuDelegate(cacheArray[i]["cacheId"], logArray), WatchUi.SLIDE_IMMEDIATE);
                break;
            }
        }
    }
}