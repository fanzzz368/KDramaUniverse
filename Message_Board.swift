
import SwiftUI

@main
struct Message_Board: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            messagesView()
        }
    }
}
