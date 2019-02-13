# Simple-Service-Locator-For-Functions-With-Different-Types

This project describes the use of a service locator which chooses between funcs having an input class model and an output class model stored in the mock api manager and the remote manager
Note :- 
the funcs in the mock and remote api manager have the same signature.

First initialize the type in AppDelegate

```swift
ServiceLocator.defaultLocator.type = ServiceLocatorType.mock
```

To try it out check the code in ViewController:-

```swift
        //the first two lines are just for innitializing the mock and remote manager ideally it should not be done here, im doing it here to show you how Service Locator switches between API's
        let mockManager = MockManager()
        let remoteManager = RemoteManager()
        
        
        //fetch appropriate manager based on whether remote or mock is set in app delegate
        guard let unwrappedInstance:((TestModel)->(TestModel)) = ServiceLocator.defaultLocator.service() else{
            return
        }
        print(unwrappedInstance(TestModel()))
```

