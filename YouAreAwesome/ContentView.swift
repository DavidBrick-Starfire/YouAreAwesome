//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Brick on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
            Text("You Are Awesome!")
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
//                .foregroundStyle(.red)
            Spacer()
            HStack {
                Spacer()
                Button("Awesome!") {
                    message = "Awesome!"
                    print(message)
                }
                Spacer()
                Button("Great!") {
                    message = "Great!"
                    print(message)
                }
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
