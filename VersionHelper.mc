using Toybox.System;

class VersionHelper{

    function isMenu2Supported() {
        var version = System.getDeviceSettings().monkeyVersion;
        return version[0] >= 3;
    }
}