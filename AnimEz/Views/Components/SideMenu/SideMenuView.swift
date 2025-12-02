//
//  SideMenuView.swift
//  AnimEz
//
//  Created by Ryan Lauret on 02/12/2025.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            if isShowing {
                // Dimmed background
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isShowing = false
                        }
                    }
                
                // Menu content
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("PrimaryColor"))
                        
                        Text("UserName")
                            .font(Font.custom("ReggaeOne-Regular", size: 20))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                    
                    // Menu items
                    MenuItemView(icon: "house.fill", title: "Home")
                    MenuItemView(icon: "flame.fill", title: "Trending")
                    MenuItemView(icon: "book.fill", title: "Genres")
                    MenuItemView(icon: "bookmark.fill", title: "Watchlist")
                    MenuItemView(icon: "heart.fill", title: "Favorite")
                    MenuItemView(icon: "clock.fill", title: "History")
                    
                    Spacer()
                }
                .frame(width: 280)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .transition(.move(edge: .leading))
            }
        }
    }
}
