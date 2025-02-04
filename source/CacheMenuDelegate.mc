using Toybox.WatchUi;
using Toybox.System;

class CacheMenuDelegate extends WatchUi.Menu2InputDelegate {

    var logArray;

    function initialize(logs) {
        logArray = logs;
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var menu = new WatchUi.Menu2({:title=>item.getLabel()});
        for( var i = 0; i < logArray.size(); i++){
            menu.addItem(
            new MenuItem(
                logArray[i]["text"],
                logArray[i]["type"],
                logArray[i]["logId"],
                {}
            )
        );
        }
        WatchUi.popView(WatchUi.SLIDE_UP);
        WatchUi.pushView(menu, new LogMenuDelegate(item.getId()), WatchUi.SLIDE_IMMEDIATE);
    }
}