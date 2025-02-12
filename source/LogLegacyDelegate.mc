import Toybox.WatchUi;

class LogLegacyMenuDelegate extends WatchUi.MenuInputDelegate {

    var cacheId;
    var logArray;

    function initialize(cacheId, logs) {
        self.cacheId = cacheId;
        self.logArray = logs;
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {        
        for( var i = 0; i < logArray.size(); i++){
            if(logArray[i]["logId"] == item){
            Communications.transmit({ "type" => "SET_LOG","cacheId" => cacheId, "logId" => logArray[i]["logId"] }
                , null, new SendingLogCallback());
                break;
            }
        }
    }

class SendingLogCallback extends Toybox.Communications.ConnectionListener{

        function initialize() {
            Toybox.Communications.ConnectionListener.initialize();
        }

        function onError(){
        }

        function onComplete(){ 
            // WatchUi.popView(WatchUi.SLIDE_UP);    
        }
    }
}