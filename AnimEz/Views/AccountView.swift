//
//  AccountView.swift
//  AnimEz
//
//  Created by Ryan Lauret on 02/12/2025.
//


import SwiftUI

struct AccountView: View {
    @State private var showMenu = false
    
    var body: some View {
        ZStack {
            // Gradient background matching HomeView
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Top navigation bar
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
                    }
                    .padding(.top, 10)
                    
                    
                    // Profile section
                    VStack(spacing: 16) {
                        // Profile image
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 3)
                            )
                        
                        // Username
                        Text("UserName")
                            .font(Font.custom("ReggaeOne-Regular", size: 24))
                            .foregroundColor(Color("PrimaryColor"))
                        
                        // Stats row
                        HStack(spacing: 16) {
                            StatCard(number: "232", label: "watched", isHighlighted: true)
                            StatCard(number: "415", label: "watchlist", isHighlighted: true)
                            StatCard(number: "27", label: "favorites", isHighlighted: true)
                        }
                        .padding(10)
                        
                        // Connect button
                        Button(action: {
                            // Connect to MyAnimeList action
                        }) {
                            Text("Connect to MyAnimeList")
                                .font(Font.custom("ReggaeOne-Regular", size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(maxHeight: 10)
                                .padding()
                                .background(Color("PrimaryColor"))
                                .cornerRadius(14)
                        }
                        .padding(.horizontal, 80)
                        .padding(.top, 10)
                    }
                    .padding(.top, 20)
                    
                    // Settings section
                    VStack(spacing: 0) {
                        // Settings items
                        SettingsRow(title: "My account", value: nil, hasArrow: true)
                        Divider().padding(.leading, 24)
                        
                        SettingsRow(title: "Language", value: "English", hasArrow: true)
                        Divider().padding(.leading, 24)
                        
                        SettingsRow(title: "Notification", value: "Yes", hasArrow: true)
                        Divider().padding(.leading, 24)
                        
                        SettingsRow(title: "Privacy Policy", value: nil, hasArrow: false)
                        Divider().padding(.leading, 24)
                        
                        SettingsRow(title: "Clear History", value: nil, hasArrow: false)
                        Divider().padding(.leading, 24)
                        
                        SettingsRow(title: "Log Out", value: nil, hasArrow: false)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                    }
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .padding(.top, 30)
                    
                    Spacer().frame(height: 40)
                }
            }
            
            // Sakura decoration (bottom left)
            VStack {
                Spacer()
                HStack {
                    Image("SakuraDecoration") // Your sakura image
                        .resizable()
                        .frame(width: 120, height: 150)
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
            // Side menu overlay
            SideMenuView(isShowing: $showMenu)
        }
    }
}

// Stat card component
struct StatCard: View {
    let number: String
    let label: String
    var isHighlighted: Bool = false
    
    var body: some View {
        VStack(spacing: 2) {
            Text(number)
                .font(Font.custom("ReggaeOne-Regular", size: 20))
                .foregroundColor(isHighlighted ? Color("PrimaryColor") : Color("PrimaryColor").opacity(0.7))
            
            Text(label)
                .font(Font.custom("ReggaeOne-Regular", size: 12))
                .foregroundColor(isHighlighted ? Color("PrimaryColor") : Color("PrimaryColor").opacity(0.6))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .background(Color.white.opacity(isHighlighted ? 0.95 : 0.7))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isHighlighted ? Color("PrimaryColor") : Color.clear, lineWidth: 2)
        )
    }
}

// Settings row component
struct SettingsRow: View {
    let title: String
    let value: String?
    let hasArrow: Bool
    
    var body: some View {
        Button(action: {
            // Handle tap
        }) {
            HStack {
                Text(title)
                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                
                Spacer()
                
                if let value = value {
                    Text(value)
                        .font(Font.custom("ReggaeOne-Regular", size: 16))
                        .foregroundColor(Color("PrimaryColor").opacity(0.7))
                }
                
                if hasArrow {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("PrimaryColor").opacity(0.5))
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .background(Color.white.opacity(0.9))
        }
    }
}

// Corner radius extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    AccountView()
}
