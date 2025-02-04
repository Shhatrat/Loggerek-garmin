import Toybox.Lang;
import Toybox.WatchUi;

class LoggerekDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // function onMenu() as Boolean {
        // WatchUi.pushView(new Rez.Menus.MainMenu(), new LoggerekMenuDelegate(), WatchUi.SLIDE_UP);
        // return true;
    // }

    function onMenu() as Boolean {
        var menu = new WatchUi.Menu2({:title=>"My Menu2"});
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
        return true;    }

}