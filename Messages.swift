import Foundation
import SwiftUI

class Messages: ObservableObject {
    @Published var listMessages = [Message]() {
        didSet  {
            //print("hello world")
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(listMessages){
                UserDefaults.standard.set(encoded, forKey: "Messages")
            }
        }
    }

init() {
    //print("hello")
    //print(UserDefaults.standard.data(forKey: "Messages"))
     if let savedMessages = UserDefaults.standard.data(forKey: "Messages"){
         if let decodedMessages = try? JSONDecoder().decode([Message].self, from: savedMessages){
             listMessages = decodedMessages
             return
         }
     }
     listMessages = []
 }
}

