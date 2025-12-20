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
                repeat {
                    messageNumber=Int.random(in: 0..<messages.count)
                } while messageNumber == lastMessageNumber
                lastMessageNumber=messageNumber
                message = messages[messageNumber]
                //                message=messages.randomElement()!
                //                imageNumber=Int.random(in: 0...9)
                
                repeat {
                    imageNumber=Int.random(in: 0...numberOfImages-1)
                } while imageNumber == lastImageNumber
                lastImageNumber=imageNumber
                imageName=("image\(Int.random(in: 0..<numberOfImages))")
                
                repeat {
                    soundNumber=Int.random(in: 0...numberOfSounds-1)
                    print(soundNumber)
                } while soundNumber == lastSoundNumber
                lastSoundNumber=soundNumber
                soundName=("sound\(soundNumber)")
                
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
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .padding()
        //                message=messages[messageNumber]
        //                messageNumber += 1
        //                if messageNumber == messages.count {
        //                    messageNumber = 0
        //                }
        
        //               print(messages)
        //                let message1 = "You Are Awesome!"
        //            let message2 = "You Are Great!"
        //               let imageString1 = "hand.thumbsup"
        //             let imageString2 = "sun.max.fill"
        //                if message == message1 {
        //                    message = message2
        //                    imageString = imageString2
        //                } else {
        //                    message = message1
        //                    imageString = imageString1
        //                }
        //                message = ( message == message1 ? message2 : message1)
        //                imageName = ( imageName == "image0" ? "image1" : "image0")
        
        //TODO: Update the imageName variable
        //                imageName = "image" + String(imageNumber)
        //                imageName = ("image\(imageNumber)")
        //                imageNumber += 1
        //                if imageNumber > 9 {
        //                    imageNumber = 0
        //                }
        //               print(imageNumber)
        
        
        //            .tint(.orange)
    }
    
}


#Preview {
    ContentView()
}
