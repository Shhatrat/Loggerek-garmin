import Toybox.Lang;
import Toybox.WatchUi;

class LoggerekDelegate extends WatchUi.BehaviorDelegate {

    var view;

    function initialize(view) {
        System.println("-----");
        System.println(System.getDeviceSettings().monkeyVersion);
        System.println("-----");

        BehaviorDelegate.initialize();
        self.view = view;
        Communications.registerForPhoneAppMessages(method(:phoneMessageCallback));
    }

    function onKey(keyEvent) {
        if(keyEvent.getKey() == 4){
            System.println("Key 4 pressed");
            sendRequestForData();
        }
        if(keyEvent.getKey() == 5){
            WatchUi.popView(WatchUi.SLIDE_UP);
        }
        return true;
    }

    function sendRequestForData(){
        Communications.transmit({"type" => "GET_DATA"}, null, new SendingHelloCallback(self.view));
    }

class SendingHelloCallback extends Toybox.Communications.ConnectionListener{

    var view;

    function initialize(view) {
        Toybox.Communications.ConnectionListener.initialize();
        self.view = view;
        System.print("initialize -->");
 	}

    function onError(){
        System.print("error -->");
    }

    function onComplete(){ 
        System.print("complete -->");
    }
}

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new LoggerekMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function phoneMessageCallback(msg as Toybox.Communications.PhoneAppMessage) as Void {
        var array = msg.data["items"];
        if(new VersionHelper().isMenu2Supported()){
        var menu = new WatchUi.Menu2({:title=>"Caches"});

        for( var i = 0; i < array.size(); i++){
            menu.addItem(
            new MenuItem(
                array[i]["title"],
                array[i]["cacheId"],
                array[i]["cacheId"],
                {}
            )
        );
        }
        WatchUi.pushView(menu, new CacheMenuDelegate(msg.data["logs"]), WatchUi.SLIDE_IMMEDIATE);
        }else{
            var menu = new WatchUi.Menu();
            var delegate;
            menu.setTitle("Caches");
            for( var i = 0; i < array.size(); i++){
                menu.addItem(array[i]["title"], array[i]["cacheId"]);
            }
            WatchUi.pushView(menu, new CacheLegacyMenuDelegate(msg.data["logs"], array), WatchUi.SLIDE_IMMEDIATE);
        }
    }
}