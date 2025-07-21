//
//  SakuraLogo.swift
//  AnimEz
//
//  Created by Ryan Lauret on 21/07/2025.
//

import SwiftUI

//Logo Sakura
struct SakuraLogo: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("SakuraLogo")
                    .resizable()
                    .frame(width: 187, height: 280)
                    .padding(.leading, -66)
                    .padding(.bottom, -30)
                Spacer()
            }
        }
    }
}
