//
//  ContentView.swift
//  SwiftUIMarathon8
//
//  Created by @_@ on 22.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack {
                LinearGradient(colors: [.blue, .purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                Slider()
            }
            .ignoresSafeArea()
        }
}

#Preview {
    ContentView()
}
