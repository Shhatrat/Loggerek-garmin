using Toybox.WatchUi;
using Toybox.System;

class LogMenuDelegate extends WatchUi.Menu2InputDelegate {

    var cacheId;

    function initialize(cacheId) {
        self.cacheId = cacheId;
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        // System.println(item.getId());

        var message = new Toybox.Communications.PhoneAppMessage();
        message.data = { "cacheId" => cacheId, "logId" => item.getId() };
        System.println("---->");
        System.println(message.data["cacheId"]);
        System.println("<----");
        System.println(message.data["logId"]);
        // Communications.transmit(message, null, new SendingHelloCallback(self.view));
        WatchUi.popView(WatchUi.SLIDE_UP);
    }
}