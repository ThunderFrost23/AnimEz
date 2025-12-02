//
//  GradientBackground.swift
//  AnimeEz
//
//  Created by Ryan Lauret on 17/07/2025.
//

import SwiftUI

struct GradientBackground<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            content
        }
    }
}
