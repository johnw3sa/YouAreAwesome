//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John Eigenbrode on 1/13/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages: Int = 10 // images labled image0 - image9
    let numberOfSounds: Int = 6  // sounds labled sound0 - sound5
    
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
            
            Spacer()
            
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
                    
                    var messageNumber : Int
                    repeat {
                        messageNumber = Int.random(in: 0..<messages.count-1)
                    } while messageNumber == lastMessageNumber
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    
                    var imageNumber : Int
                    repeat {
                        imageNumber = Int.random(in: 0...numberOfImages-1)
                    } while imageNumber == lastImageNumber
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                    
                    var soundNumber : Int
                    repeat {
                        soundNumber = Int.random(in: 0...numberOfSounds-1)
                    } while soundNumber == lastSoundNumber
                    imageName = "image\(soundNumber)"
                    lastSoundNumber = soundNumber
                    
                    let soundName = "sound\(soundNumber)"
                    guard let soundFile = NSDataAsset(name: soundName)?.data else {
                        print(" 😡 Could not read file named \(soundName)")
                        return }
                    
                    do{
                        audioPlayer = try AVAudioPlayer(data: soundFile)
                        audioPlayer?.play()
                    } catch {
                        print(" 😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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
