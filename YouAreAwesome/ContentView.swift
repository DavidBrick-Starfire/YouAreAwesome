//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Brick on 12/15/25.
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
                       .frame(height: 100)
                       .minimumScaleFactor(0.5)
                       .animation(.easeInOut(duration: 0.15),value: message)
                   //                .foregroundStyle(.red)
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
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Amazing!",
                                "You Make Me Smile!"
                ]
                message=messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                 
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
                imageName = ("image\(imageNumber)")
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
 //               print(imageNumber)


            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
//            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
