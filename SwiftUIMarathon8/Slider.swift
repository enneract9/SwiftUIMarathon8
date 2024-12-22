//
//  Slider.swift
//  SwiftUIMarathon8
//
//  Created by @_@ on 22.12.2024.
//

import SwiftUI

struct Slider: View {
    @State private var state = SliderState.inside
    @State private var progress = Double.zero
    @State private var lastProgress = Double.zero

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                Rectangle()
                    .foregroundColor(.white)
                    .scaleEffect(y: progress, anchor: .bottom)
            }
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .gesture(makeGesture(height: proxy.size.height))
        }
        .offset(y: state.offset)
        .frame(width: state.width, height: state.height)
    }

    private func makeGesture(height: Double) -> some Gesture {
        DragGesture()
        .onChanged { gesture in
            let verticalOffset = gesture.startLocation.y - gesture.location.y
            progress = max(min((lastProgress + (verticalOffset / height)), 1), 0)
            withAnimation {
                state.updateState(for: progress)
            }
        }.onEnded { _ in
            withAnimation {
                state = .inside
                lastProgress = progress
            }
        }
    }
}

#Preview {
    Slider()
}
