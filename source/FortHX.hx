import sys.io.Process;
import sys.io.File;
import sys.net.Socket;
import sys.net.Host;

class FortHX {
    static var port:Int = 6969;
    static var maxConnections:Int = 5;
    static var server:Socket;

    static function main() {
        trace("FortHX is starting...");

        server = new Socket();
        try {
            server.bind(new Host("127.0.0.1"), port);
            server.listen(maxConnections);
            trace("FortHX is listening on port " + port);
        } catch (e:Dynamic) {
            trace("Failed to bind to port " + port + ": " + e.message);
            return;
        }

        var timer = new haxe.Timer(1000);
        timer.run = function() {
            trace(port + " is already being used somewhere else!");
        };

        while (true) {
            Sys.sleep(1000);
        }

        server.close();
        trace("Server shut down.");
    }
}
