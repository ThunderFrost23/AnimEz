//
//  HomeView.swift
//  AnimEz
//
//  Created by Ryan Lauret on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var showMenu = false
    var navigateToAccount: () -> Void

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                // Top menu bar
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .foregroundColor(Color("PrimaryColor"))
                        .shadow(radius: 1)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showMenu.toggle()
                            }
                        }

                    Spacer()

                    ZStack {
                        Circle()
                            .stroke(Color("PrimaryColor"), lineWidth: 2)
                            .frame(width: 40, height: 40)

                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("PrimaryColor"))
                            .shadow(radius: 1)
                    }
                    .padding()
                    .onTapGesture {
                        navigateToAccount()
                    }
                }
                .padding(.top, 10)


                // Welcome text
                VStack(alignment: .leading, spacing: 3) {
                    Text("Heyy!")
                        .font(Font.custom("ReggaeOne-Regular", size: 24))
                        .foregroundColor(.white)

                    Text("What do you want to see ?")
                        .font(Font.custom("ReggaeOne-Regular", size: 14))
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)

                // Centered logo
                Image("TransparentLogo")
                    .resizable()
                    .frame(width: 180, height: 180)

                Spacer()

                // Glowing mic button
                ZStack {
                    Circle()
                        .fill(Color("BackgroundPink").opacity(0.9))
                        .frame(width: 130, height: 130)
                        .blur(radius: 10)

                    Image(systemName: "mic")
                        .resizable()
                        .frame(width: 35, height: 50)
                        .foregroundColor(Color("PrimaryColor"))
                }

                Spacer().frame(height: 25)

                // Search field
                TextField(
                    "",
                    text: $searchText,
                    prompt: Text("Search")
                        .foregroundColor(Color("BackgroundPink"))
                        .font(Font.custom("ReggaeOne-Regular", size: 18))
                )
                .foregroundColor(Color("PrimaryColor"))
                .font(Font.custom("ReggaeOne-Regular", size: 18))
                .padding()
                .frame(width: 320, height: 50)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .pink.opacity(0.2), radius: 5, x: 0, y: 3)

                Spacer().frame(height: 140)
            }
            .blur(radius: showMenu ? 3 : 0)

            // Overlay the side menu
            SideMenuView(isShowing: $showMenu)
            
            // Logo Sakura
            SakuraLogo()
        }
    }
}

#Preview {
    HomeView(navigateToAccount: {})
}
