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
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("You Are Awesome!")
            Text(message)
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundStyle(.red)
            
            Button("Click Me!") {
                message = "and I am Awesome"
                print(message)
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
