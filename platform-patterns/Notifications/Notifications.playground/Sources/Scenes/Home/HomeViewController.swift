import UIKit

public class HomeViewController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        addObservers()
    }
}

private extension HomeViewController {
    func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(settingsChanged),
            name: .HWSSettingsDidChange,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(settingsChangedByUnicornAPI),
            name: .HWSSettingsDidChange,
            object: UnicornAPI.shared
        )
    }
    
    
    @objc func settingsChanged(notification: Notification) {
        print("Settings changed!")
        
        if let userInfo = notification.userInfo {
            print("Got userInfo in notification...")
            print(userInfo)
        }
    }
    
    @objc func settingsChangedByUnicornAPI(notificaiton: Notification) {
        print("Settings changed by UnicornAPI 🦄!")
    }
}
