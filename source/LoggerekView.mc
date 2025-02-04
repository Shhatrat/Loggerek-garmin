import Toybox.Graphics;
import Toybox.WatchUi;

class LoggerekView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    function update(text){
        message = text;
        requestUpdate();
    }

    var message = "Wcisnij start\naby pobrac";

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        var screenHeight = dc.getHeight();
        var textHeight = dc.getFontHeight(Graphics.FONT_LARGE);
        var textWidth = dc.getTextWidthInPixels(message, Graphics.FONT_LARGE);
        var y = (screenHeight - textHeight) / 2;
        dc.drawText(140, y, Graphics.FONT_LARGE, message, Graphics.TEXT_JUSTIFY_CENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(260, 80, 20); 
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }
}
