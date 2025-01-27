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
                    
                    lastMessageNumber = nonRepeatingRandomInt(
                        lastRandomNumber: lastMessageNumber,
                        min: 0,
                        max: messages.count-1
                    )
                    message = messages[lastMessageNumber]
                 
                    lastImageNumber = nonRepeatingRandomInt(lastRandomNumber: lastImageNumber, min: 0, max: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                   
                    lastSoundNumber = nonRepeatingRandomInt(lastRandomNumber: lastSoundNumber, min: 0, max: numberOfSounds-1)
                    playSound(soundName: "sound\(lastSoundNumber)")
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
    }
    
    func playSound(soundName: String) {
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
    
    func nonRepeatingRandomInt(lastRandomNumber: Int, min: Int, max: Int) -> Int {
        var randomNumber = Int.random(in: min...max)
        while randomNumber == lastRandomNumber {
            randomNumber = Int.random(in: min...max)
        }
        return randomNumber
    }
        
    }


#Preview {
    ContentView()
}
