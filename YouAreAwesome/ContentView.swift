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
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius:30)
//            Image(systemName: imageString)
//                .resizable()
//                .scaledToFit()
//                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            //                .foregroundStyle(.red)
            Spacer()
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
//               let imageString1 = "hand.thumbsup"
//             let imageString2 = "sun.max.fill"
//                if message == message1 {
//                    message = message2
//                    imageString = imageString2
//                } else {
//                    message = message1
//                    imageString = imageString1
//                }
                message = ( message == message1 ? message2 : message1)
                imageName = ( imageName == "image0" ? "image1" : "image0")
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
