//
//  LoginView.swift
//  AnimeEz
//
//  Created by Ryan Lauret on 17/07/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var animateGradient = false
    
    var body: some View {
        GradientBackground {
            //Stack vertically
            VStack(alignment: .center) {
                Spacer()
                VStack(spacing: 25) {
                    //Logo
                    Image("TransparentLogo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    //Welcome text
                    Text("Welcome to AnimEz!")
                        .font(Font.custom("ReggaeOne-Regular", size: 24))
                        .foregroundColor(.white)
                    
                    //Username field
                    TextField("", text: $username, prompt: Text("Username").foregroundColor(Color("BackgroundPink")))
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
                                    LinearGradient(colors:[Color.backgroundPink, Color.backgroundBlue],
                                                   startPoint: animateGradient ? .topLeading : .bottomTrailing,
                                                   endPoint: animateGradient ? .bottomTrailing :
                                            .topLeading
                                                  ),
                                    lineWidth: 3
                                )
                                .animation(.linear(duration: 3).repeatForever(autoreverses: true), value: animateGradient)
                        )
                        .padding(.horizontal)
                    
                    
                    //Password field
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(Color("BackgroundPink")))
                        .font(Font.custom("ReggaeOne-Regular", size: 16))
                        .frame(width: 330, height: 40)
                        .foregroundColor(Color("PrimaryColor"))
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    LinearGradient(colors:[Color.backgroundPink, Color.backgroundBlue],
                                                   startPoint: animateGradient ? .topLeading : .bottomTrailing,
                                                   endPoint: animateGradient ? .bottomTrailing :
                                            .topLeading
                                                  ),
                                    lineWidth: 3
                                )
                                .animation(.linear(duration: 3).repeatForever(autoreverses: true), value: animateGradient)
                        )
                }
                
            
                Spacer()
                VStack(spacing: 16) {
                    //Log in button
                    Button(action: {
                        print("log in button")
                    }) {
                        Text("LOG IN")
                            .font(Font.custom("ReggaeOne-Regular", size: 16))
                            .frame(width: 330, height: 40)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .border(Color("PrimaryColor"))
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                    }
                    
                    
                    //Sign up button
                    Button(action: {
                        print("sign up button")
                    }) {
                        Text("SIGN UP")
                            .font(Font.custom("ReggaeOne-Regular", size: 16))
                            .frame(width: 330, height: 40)
                            .foregroundColor(Color("PrimaryColor"))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom, 75)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            
            
            //Logo Sakura
            SakuraLogo()
        }
    }
}

#Preview {
    LoginView()
}
