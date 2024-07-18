# NavUI

## Description
NavUI is a framework to handle with navigation in SwiftUI using NavigationStack. With NavUI it is possible to use easily Coordinators flows.

### Example of usage

With Navigation class, you can keep the object in Coordinator, for example:
```swift
import NavUI

final class MainCoordinator {
	let navigation: Navigation
	
	init(navigation: Navigation = .init())
		self.navigation = navigation
	}
	
	func start() -> some View {
		return navigation.start(root: ExampleRootView())
	}
}
```

In this way, you can start the app scene calling the `start` method of your coordinator, like:
```swift
@main
struct NavUaiApp: App {
    var body: some Scene {
        WindowGroup {
          MainCoordinator().start()
        }
    }
}
```

With that, another features/coordinator, can be pushed in navigation just with inject the Navigation object
```swift
final class MainCoordinator {
	[...]
	func goToAnotherFeature() {
		AnotherFeatureCoordinator(navigation: navigation).start()
	}
}

final class AnotherFeatureCoordinator {
	let navigation: Navigation
	
	init(navigation: Navigation = .init())
		self.navigation = navigation
	}
	
	func start() {
		navigation.push(FirstFeatureView())
	}
}
```
