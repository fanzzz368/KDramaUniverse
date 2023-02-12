

import SwiftUI
import Foundation
import Messages

struct messagesView: View {
    @StateObject var messages = Messages()
    @State private var showAddedMessage = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(messages.listMessages.sorted(by: {$0.time > $1.time})) {
                    item in HStack {
                        VStack(alignment: .leading) {
                            
                            Label(item.username, systemImage: "person")
                                .font(.headline)
                                .labelStyle(.titleOnly)
                                .foregroundColor(.black)
                                .monospaced()
                            
                            
                            Spacer()
                            
                            Label(item.kdrama, systemImage: "play.tv")
                                .font(.headline)
                                .labelStyle(.titleOnly)
                                .foregroundColor(.black)
                                .monospaced()
                                
                            
                            Spacer()
                            
                            Label(item.rating, systemImage: "star.fill")
                                .font(.headline)
                                .labelStyle(.titleOnly)
                                .foregroundColor(.black)
                                .monospaced()
                            
                            Spacer()
                            
                            Label(item.message, systemImage: "message")
                                .font(.headline)
                                .labelStyle(.titleAndIcon)
                                .foregroundColor(.purple)
                                .monospaced()
                            
                            
                            Spacer()
                            
                            
                            Label(item.time.formatted(.dateTime.day().month().year().hour().minute().second()), systemImage: "time")
                                .font(.system(size: 10, weight: .regular, design: .monospaced))
                                .labelStyle(.titleOnly)
                                .foregroundColor(.secondary)
                                .monospaced()
                            
                            
                            
                            NavigationLink {
                                AddReply()
                            } label: {
                                Label("", systemImage: "arrowshape.turn.up.backward.circle")
                                    .labelStyle(.iconOnly)
                                
                            }
                        }
                        
                        
                        
                        
                        //                            }
                        //                                Button(action: {
                        //                                    //
                        //                                }) {
                        //                                    Image(systemName: "arrowshape.turn.up.backward.circle")
                        //                                        .monospaced()
                        //                                        .foregroundColor(.secondary)
                        //                                }
                        
                        
                    }
                }
            }
                    
                    
                    
            
                    
                        
    
        
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Kdrama Discussion Board")
            .toolbar{
                Button{
                    showAddedMessage = true
                } label: {
                    Image(systemName: "plus.circle")
                    .foregroundColor(.purple)
                }
            }
            .sheet(isPresented: $showAddedMessage) {
                AddMessages(messages: messages)
            }
        }
    }
}

struct View_Previews: PreviewProvider {
    static var previews: some View {
        messagesView()
    }
}
