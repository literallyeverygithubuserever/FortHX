# FortHX - The first Fortnite backend to be made in Haxe!

Fortnite Server Emulator/Backend in Haxe!

This is a heavy work in progress don't expect this to be done anytime soon!

## Features Todo

- [x] Make the port useable
- [ ] A lot

# Fiddler Script to redirect:

```csharp
import Fiddler;

class Handlers
{
    static function OnBeforeRequest(oSession: Session) {
        if (oSession.hostname.Contains("ol.epicgames.") ||            
            oSession.hostname.Contains("s3-us-west-1.amazonaws.com")) 
        {
            if (oSession.HTTPMethodIs("CONNECT"))
            {
                oSession["x-replywithtunnel"] = "ServerTunnel";
                return;
            }
            oSession.fullUrl = "http://127.0.0.1:6969/" + oSession.PathAndQuery
        }
    }
}
```
