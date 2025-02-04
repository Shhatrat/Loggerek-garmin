import Toybox.Lang;
import Toybox.WatchUi;

class LoggerekDelegate extends WatchUi.BehaviorDelegate {

    var view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        self.view = view;
        Communications.registerForPhoneAppMessages(method(:phoneMessageCallback));
    }

    function onKey(keyEvent) {
        if(keyEvent.getKey() == 4){
            System.println("Key 4 pressed");
            sendRequestForData();
                    view.update("dxxd");
        }
        return true;
    }

    function sendRequestForData(){
        var message = new Toybox.Communications.PhoneAppMessage();
        message.data = "Hello from the watch!";
        Communications.transmit("message", null, new SendingHelloCallback());
    }

    class SendingHelloCallback extends Toybox.Communications.ConnectionListener{
	    	function initialize(){
				Toybox.Communications.ConnectionListener.initialize();
                System.print("initialize -->");
 			}

    		function onError(){
                System.print("error -->");
	    	}

    		function onComplete(){ 
                System.print("complete -->");
    		}
   		}

    // function onMenu() as Boolean {
        // WatchUi.pushView(new Rez.Menus.MainMenu(), new LoggerekMenuDelegate(), WatchUi.SLIDE_UP);
        // return true;
    // }

       function phoneMessageCallback(msg as Toybox.Communications.PhoneAppMessage) as Void {
      System.println(msg.data);
      System.println(msg.data["items"][0]["title"]);
//      System.println(msg["items"]);
    //   System.println(msg.data["items"]);
    }


    function onMenu() as Boolean {
        var menu = new WatchUi.Menu2({:title=>"Caches"});
        var delegate;
        menu.addItem(
            new MenuItem(
                "Item 1 Label",
                "Item 1 subLabel",
                "itemOneId",
                {}
            )
        );
        menu.addItem(
            new MenuItem(
                "Item 2 Label",
                "Item 2 subLabel",
                "itemTwoId",
                {}
            )
        );
//        delegate = new MyMenu2Delegate(); // a WatchUi.Menu2InputDelegate
        WatchUi.pushView(menu, new LoggerekMenuDelegate(), WatchUi.SLIDE_IMMEDIATE);
        return true;    
        }

}