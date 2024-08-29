import SwiftUI

@main
struct CoreApiApp: App {
    
    init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { result, error in
            
            if let error = error {
                print(error)
            }
        }
        
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
