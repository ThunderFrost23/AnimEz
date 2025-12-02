//
//  MenuViewItem.swift
//  AnimEz
//
//  Created by Ryan Lauret on 02/12/2025.
//


import SwiftUI

struct MenuItemView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(Color("PrimaryColor"))
            
            Text(title)
                .font(Font.custom("ReggaeOne-Regular", size: 16))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}
