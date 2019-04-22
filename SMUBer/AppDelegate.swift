import UIKit
import GoogleMaps

// 1
let googleApiKey = "AIzaSyBgyiZkFh6LuPJpuaAxF7ksGk9YcaXEpmk"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //2
        GMSServices.provideAPIKey(googleApiKey)
        return true
    }
}
