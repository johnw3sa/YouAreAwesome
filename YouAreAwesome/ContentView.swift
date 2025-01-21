//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John Eigenbrode on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height:  100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .imageScale(.large)
                .clipShape(.rect(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Button("Show Message!") {

                    let messages = [
                        "You are Awesome!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You are Great!",
                        "Fabulous? That's You!",
                        "You are Magical!",
                        "You are very Skilled!",
                        "You have excelled to the highest level!"
                        
                    ]

                    message = messages[messageNumber]
                    messageNumber += 1
                    if messageNumber == messages.count {
                        messageNumber = 0
                    }
                                
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
           
        }
        .padding()
    }
}
    
    #Preview {
        ContentView()
    }
