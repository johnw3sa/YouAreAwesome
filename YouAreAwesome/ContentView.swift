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
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .imageScale(.large)
                .clipShape(.rect(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            HStack {
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    message = ( message == message1 ? message2 : message1)
                    imageName = ( imageName == "image0" ? "image1" : "image0")
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
