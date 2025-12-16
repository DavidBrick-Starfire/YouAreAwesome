//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Brick on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundStyle(.green)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
