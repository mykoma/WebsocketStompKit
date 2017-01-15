Pod::Spec.new do |s|
  s.name         = "WebsocketStompKit"
  s.version      = "0.1.1"
  s.summary      = "STOMP over Websocket Objective-C Client for iOS."
  s.homepage     = "https://github.com/rguldener/WebsocketStompKit"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Jeff Mesnil & Robin Guldener"
  s.source       = { :git => 'https://github.com/rguldener/WebsocketStompKit.git' }
  s.ios.deployment_target = '6.0'
  s.source_files = 'WebsocketStompKit/*.{h,m}'
  s.public_header_files = 'WebsocketStompKit/WebsocketStompKit.h'
  s.requires_arc = true
  s.dependency     'jetfire', '0.1.2'
end
