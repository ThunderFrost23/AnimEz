//
//  ContentView.swift
//  AnimEz
//
//  Created by Ryan Lauret on 17/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView: ViewType = .home
    
    var body: some View {
        ZStack {
            HomeView(navigateToAccount: { currentView = .account })
        }
    }
}

enum ViewType {
    case home, account
}
