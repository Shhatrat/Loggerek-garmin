using Toybox.WatchUi;
using Toybox.System;

class LogMenuDelegate extends WatchUi.Menu2InputDelegate {

    var cacheId;

    function initialize(cacheId) {
        self.cacheId = cacheId;
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        Communications.transmit({ "type" => "SET_LOG","cacheId" => cacheId, "logId" => item.getId() }
        , null, new SendingLogCallback());
    }

    class SendingLogCallback extends Toybox.Communications.ConnectionListener{

        function initialize() {
            Toybox.Communications.ConnectionListener.initialize();
        }

        function onError(){
        }

        function onComplete(){ 
           WatchUi.popView(WatchUi.SLIDE_UP);    
        }
    }
}