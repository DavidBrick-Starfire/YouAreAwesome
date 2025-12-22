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
            Button("Show Message")  {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Amazing!",
                                "You Make Me Smile!"
                ]
//                repeat {
//                    messageNumber=Int.random(in: 0..<messages.count)
//                } while messageNumber == lastMessageNumber
//                lastMessageNumber=messageNumber
//                message = messages[messageNumber]
//                //                message=messages.randomElement()!
//                //                imageNumber=Int.random(in: 0...9)
//                
//                repeat {
//                    imageNumber=Int.random(in: 0...numberOfImages-1)
//                } while imageNumber == lastImageNumber
//                lastImageNumber=imageNumber
//                imageName=("image\(Int.random(in: 0..<numberOfImages))")
//                
//                repeat {
//                    soundNumber=Int.random(in: 0...numberOfSounds-1)
//                    print(soundNumber)
//                } while soundNumber == lastSoundNumber
//                lastSoundNumber=soundNumber
 //TODO remove code and call the function
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                message=messages[lastMessageNumber]
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                imageName = ("image\(lastImageNumber)")
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                playSound(soundName: "sound\(lastSoundNumber)")
                print("\(lastMessageNumber), \(lastImageNumber), \(lastSoundNumber)")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
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
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}



#Preview {
    ContentView()
}
