//
//  SkipButton.swift
//  SwiftUIMarathon04
//
//  Created by Mike Rudoy on 09/05/2024.
//

import SwiftUI

struct SkipButton: View {
    @State private var animationIsInProgress: Bool = false
    var body: some View {
        Button {
            if !animationIsInProgress {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    animationIsInProgress = true
                } completion: {
                    animationIsInProgress = false
                }
            }
        } label: {
            Group {
                GeometryReader { proxy in
                    let width = proxy.size.width / 2
                    let systemName = "play.fill"
                    Group {
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: systemName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: animationIsInProgress ? width: .zero)
                                .opacity(animationIsInProgress ? 1 : .zero)
                            Image(systemName: systemName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: width)
                            Image(systemName: systemName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: animationIsInProgress ? 0.5 : width)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                    }
                }
            }.padding(20)
            .frame(maxWidth: 80, maxHeight: 80)
        }
    }
}

#Preview {
    SkipButton()
}
