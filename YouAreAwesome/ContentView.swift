//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Brick on 12/15/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    @State private var soundNumber = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer : AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15),value: message)
            //                .foregroundStyle(.red)
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius:30)
                .animation(.default, value: imageName)
            //            Image(systemName: imageString)
            //                .resizable()
            //                .scaledToFit()
            //                .foregroundStyle(.orange)
            Spacer()
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message")  {
                    let messages = ["You Are Awesome!",
                                    "When the Genius Bar Needs Help, They Call You!",
                                    "You Are Great!",
                                    "Fabulous? That's You!",
                                    "You Are Amazing!",
                                    "You Make Me Smile!"
                    ]
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    message=messages[lastMessageNumber]
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                    imageName = ("image\(lastImageNumber)")
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    print("\(lastMessageNumber), \(lastImageNumber), \(lastSoundNumber)")
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var randomNumber = 0
        repeat {
            randomNumber=Int.random(in: 0...upperBounds-1)
        } while randomNumber == lastNumber
        return randomNumber
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            if audioPlayer != nil && audioPlayer.isPlaying {
                audioPlayer.stop()
            }
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}



#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}


#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
