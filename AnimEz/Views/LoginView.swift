//
//  LoginView.swift
//  AnimEz
//
//  Created by Ryan Lauret on 17/07/2025.
//

import SwiftUI

struct LoginView: View {
    // Form fields
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth: Date? = nil
    
    // Animations
    @State private var showExtraFields = false
    
    var body: some View {
        // Navigation between view
        NavigationStack {
            // Background with gradient colors
            GradientBackground {
                VStack(alignment: .center) {
                    Spacer()
                    
                    // Logo
                    if !showExtraFields {
                        Image("TransparentLogo")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.5), value: showExtraFields)
                    }
                    
                    
                    // Welcome text
                    Text("Welcome to AnimEz!")
                        .font(Font.custom("ReggaeOne-Regular", size: 24))
                        .foregroundColor(.white)
                        
                        
                    // Main fields
                    VStack(spacing: 25) {
                        field(title: "Username", text: $username)

                        if showExtraFields {
                            field(title: "Email", text: $email)
                                .transition(.move(edge: .top).combined(with: .opacity))

                            DateOfBirthField(date: $dateOfBirth)
                        }
                        
                        secureField(title: "Password", text: $password)
                        
                        if showExtraFields {
                            secureField(title: "Confirm password", text: $password)
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: showExtraFields)

                    Spacer()
                    
                    
                    // Login and Signup buttons handle
                    VStack(spacing: 12) {
                        if !showExtraFields {
                            // Login mode
                            Button(action: {
                                print("LOG IN tapped")
                            }) {
                                Text("LOG IN")
                                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                                    .frame(width: 330, height: 40)
                                    .foregroundColor(.white)
                                    .background(Color("PrimaryColor"))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                withAnimation {
                                    showExtraFields = true
                                }
                            }) {
                                Text("SIGN UP")
                                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                                    .frame(width: 330, height: 40)
                                    .foregroundColor(Color("PrimaryColor"))
                            }

                        } else {
                            // Signup mode
                            Button(action: {
                                print("SIGN UP tapped")
                            }) {
                                Text("SIGN UP")
                                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                                    .frame(width: 330, height: 40)
                                    .foregroundColor(.white)
                                    .background(Color("PrimaryColor"))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                withAnimation {
                                    showExtraFields = false
                                }
                            }) {
                                Text("LOG IN")
                                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                                    .frame(width: 330, height: 40)
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                    }
                    .padding(.bottom, 75)
                    .animation(.easeInOut, value: showExtraFields)
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .top)
                

                //Logo Sakura
                SakuraLogo()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
    // Custom field builders
    func field(title: String, text: Binding<String>) -> some View {
        TextField("", text: text, prompt: Text(title).foregroundColor(Color("BackgroundPink")))
            .font(Font.custom("ReggaeOne-Regular", size: 16))
            .frame(width: 330, height: 40)
            .foregroundColor(Color("PrimaryColor"))
            .disableAutocorrection(true)
            .multilineTextAlignment(.center)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        LinearGradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        lineWidth: 3
                    )
                    .blur(radius: 1)
            )
            .padding(.horizontal)
    }
    
    func secureField(title: String, text: Binding<String>) -> some View {
        SecureField("", text: text, prompt: Text(title).foregroundColor(Color("BackgroundPink")))
            .font(Font.custom("ReggaeOne-Regular", size: 16))
            .frame(width: 330, height: 40)
            .foregroundColor(Color("PrimaryColor"))
            .disableAutocorrection(true)
            .multilineTextAlignment(.center)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        LinearGradient(colors: [Color("BackgroundPink"), Color("BackgroundBlue")],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        lineWidth: 3
                    )
                    .blur(radius: 1)
            )
            .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
