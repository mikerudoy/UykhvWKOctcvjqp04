//
//  ContentView.swift
//  SwiftUIMarathon04
//
//  Created by Mike Rudoy on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SkipButton()
            .buttonStyle(TappableButtonStyle())
    }
}

#Preview {
    ContentView()
}


struct TappableButtonStyle: ButtonStyle {
    
    typealias Body = Button
    
    @State private var goesDown = false
    private let halfAnimationDuration = 0.11
    private let downScaleSize = CGSize(width: 0.86, height: 0.86)
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .background(goesDown ? Color.gray.opacity(0.5) : Color.clear)
            .clipShape(Circle())
            .scaleEffect(goesDown ? downScaleSize : CGSize(width: 1, height: 1))
            .onAppear {
                self.goesDown = false
            }
            .onChange(of: configuration.isPressed) { before, after in
                if before && !after {
                    withAnimation(.linear(duration: halfAnimationDuration)) {
                        self.goesDown = true
                    } completion: {
                        withAnimation(.linear(duration: halfAnimationDuration)) {
                            self.goesDown = false
                        }
                    }

                }
            }
    }
}
