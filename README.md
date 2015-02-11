# YNMNiceCatch
============

YNMNiceCatch is Objective-C library, but for Swift.
Swift cannot handle exception, YNMNiceCatch help to handle exception.

## Feature
1. post NSNotification when catch Exception
2. nice catch : ignore exception

## Sample
notification
```
NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "methodName",
            name: YNM_EXCEPTION_NOTIFICATION,
            object: nil)

YNMNiceCatch.exceptionNotification { () -> AnyObject? in
  // call method which may raise exception
}
```

Nice Catch
```
YNMNiceCatch.niceCatch { () -> AnyObject? in
  // call method which may raise exception
}
```

## How to use
To use this Library to your iOS applications, follow these 4 easy steps:

1. Clone the YNMNiceCatch repository
2. Add YNMNiceCatch.xcodeproj to your test target
3. Link YNMNiceCatch.framework
4. import YNMNiceCatch

## License
MIT
