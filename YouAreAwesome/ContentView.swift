//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John Eigenbrode on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var symbolName = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .imageScale(.large)
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            HStack {
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let symbolName1 = "hand.thumbsup"
                    let symbolName2 = "sun.max.fill"
                    message = ( message == message1 ? message2 : message1)
                    symbolName = ( symbolName == symbolName1 ? symbolName2 : symbolName1)

                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
