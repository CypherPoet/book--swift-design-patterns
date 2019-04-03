import UIKit
import PlaygroundSupport

// Allow async notifications to complete
PlaygroundPage.current.needsIndefiniteExecution = true

let homeController = HomeViewController()
homeController.viewDidLoad()

let notificationCenter = NotificationCenter.default
let settingsChangeNotification = Notification(name: .HWSSettingsDidChange, object: nil)

let themeSettingsChangeNotification = Notification(
    name: .HWSSettingsDidChange,
    object: nil,
    userInfo: ["theme": "Dark"]
)

let targetedNotification = Notification(
    name: .HWSSettingsDidChange,
    object: UnicornAPI.shared,
    userInfo: nil
)


/// Synchronous Notifications

print("Before `NotificationCenter.default.post`")
notificationCenter.post(settingsChangeNotification)
notificationCenter.post(themeSettingsChangeNotification)
print("After `NotificationCenter.default.post`")


print("Before `NotificationCenter.default.post` with `UnicornAPI.shared` as target")
notificationCenter.post(targetedNotification)
print("After `NotificationCenter.default.post` with `UnicornAPI.shared` as target")

/// Asynchronous Notifications

/**
    Making that notification asynchronous takes three steps:

    1. Create a Notification object encapsulating the notification you want to send.
 
    2. Enqueue that with NotificationQueue, telling it when it
       should be delivered and how coalescing should work.
 
    3. Tell the playground it should continue running forever, otherwise it
       will terminate before the asynchronous work has time to happen.
*/

//let notificationQueue = NotificationQueue.default
//
//print("Before `notificationQueue.enqueue with `coalesceMask` of `.none`")
//notificationQueue.enqueue(settingsChangeNotification, postingStyle: .whenIdle, coalesceMask: .none, forModes: nil)
//notificationQueue.enqueue(settingsChangeNotification, postingStyle: .whenIdle, coalesceMask: .none, forModes: nil)
//print("After `notificationQueue.enqueue with `coalesceMask` of `.none`")
//
//print("Before `notificationQueue.enqueue with `coalesceMask` of `.onName`")
//notificationQueue.enqueue(settingsChangeNotification, postingStyle: .whenIdle, coalesceMask: .onName, forModes: nil)
//notificationQueue.enqueue(settingsChangeNotification, postingStyle: .whenIdle, coalesceMask: .onName, forModes: nil)
//print("After `notificationQueue.enqueue with `coalesceMask` of `.onName`")

