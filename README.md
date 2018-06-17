WebsocketStompKit
========

Current version: 0.1.1 (version mirrored to [StompKit](https://github.com/mobile-web-messaging/StompKit))

WebsocketStompKit is STOMP over websocket for iOS. It is built on the great [StompKit](https://github.com/mobile-web-messaging/StompKit) and replaces its socket handling library with the very well done [Jetfire](https://github.com/acmacalister/jetfire) websocket library.

## Why would I want to run STOMP over websockets on iOS?

Probably you already have a server that speaks STOMP over websockets. If you don't expect to have tens of thousands of clients at the same time, why rewrite everything from scratch? With WebsocketStompKit one server can handle both iOS and web clients.

## Installation

Install with Cocoapods
```
...
pod 'WebsocketStompKit', :git => 'https://github.com/rguldener/WebsocketStompKit.git', :tag => '0.1.1'
...
```
Jetfire comes as a dependency so be prepared for that.

## Usage

Import into your project/Objective-C headers bridge file (for Swift)

```
#import <WebsocketStompKit/WebsocketStompKit.h>
```

Then instantiate the ```STOMPClient``` class

```
NSURL *websocketUrl = [NSURL urlWithString:@"ws://my-great-server.com/websocket"];
STOMPClient *client = [[STOMPClient alloc] initWithURL:websocketUrl websocketHeaders:nil useHeartbeat:NO];
```

websocketHeaders accepts an NSDictionary of additional HTTP header entries that should be passed along with the initial websocket request. This is especially useful if you need to authenticate with cookies as by default Jetfire **will not pass cookies** along with your initial websocket-upgrade HTTP request.  
useHeartbeat allows you to deactivate the heartbeat component of STOMP (which is optional) as it is not supported by all STOMP brokers.

Once you have your client object you can connect in the same way as with StompKit
```
// connect to the broker
[client connectWithLogin:@"mylogin"
                passcode:@"mypassword"
       completionHandler:^(STOMPFrame *_, NSError *error) {
            if (err) {
                NSLog(@"%@", error);
                return;
            }

            // send a message
            [client sendTo:@"/queue/myqueue" body:@"Hello, iOS!"];
            // and disconnect
            [client disconnect];
        }];
```

Note that the completion handler which you pass into the connect method will also be called when the websocket connection gets closed or if the connection creation does not succeed.

The rest of the provided methods are the same as in [StompKit](https://github.com/mobile-web-messaging/StompKit), please refer to its Readme for basic usage information

## Differences to StompKit
Easy:

* Routes STOMP messages over websocket connection instead of a raw TCP socket
* Allows deactivation of heartbeat functionality

I plan to keep this in sync with StompKit moving forward and will mirror their versioning here.

## Authors

* StompKit: [Jeff Mesnil](http://jmesnil.net/)
* Jetfire: [Austin Cherry](http://austincherry.me) & [Dalton Cherry](http://daltoniam.com)
* Mixing the two together: Robin Guldener

