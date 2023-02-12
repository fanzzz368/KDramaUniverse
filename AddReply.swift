import SwiftUI
import Foundation

struct AddReply: View {
    @State private var inputtedUsername = ""
    @State private var inputtedMessage = ""
    @State private var badWordAlert = false
    @State private var buttonAction = false
    @State private var textLimit = 128
    @State private var listOfBadWords = ["crap", "Crap", "Darn", "darn", "Damn", "damn"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Input username", text: $inputtedUsername)
                }
                
                Section {
                    TextField("Input message", text: $inputtedMessage)
                        .onReceive(inputtedMessage.publisher.collect()) {
                            let limitedMessage = String($0.prefix(textLimit))
                            if (inputtedMessage != limitedMessage) {
                                inputtedMessage = limitedMessage
                            }
                            
                        }
                }
                Section {
                    Button() {
                        badWordAlert = false
                        for word in listOfBadWords {
                            if inputtedMessage.contains(word) {
                                badWordAlert = true
                            }
                        }
                        
                        if !badWordAlert {
                            _ = Reply(username: inputtedUsername, message: inputtedMessage, time: Date.now)
                            dismiss()
                            
                        }
                    } label : {
                        Text("Add Reply")
                            .font(.system(size: 20, weight: .regular, design: .monospaced))
                            .bold()
                            .foregroundColor(.purple)
                            .monospaced()
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                    }
                    .disabled(inputtedMessage.isEmpty)
                }
                .alert(isPresented: $badWordAlert) {
                    Alert(title: Text(""),
                          message: Text("bad word detected"))
                }
            }
        }
    }
}

