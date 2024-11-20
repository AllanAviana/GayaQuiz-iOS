//
//  ProfileImageView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        ZStack {
            Color(Color(red: 0.870, green: 0.773, blue: 0.757))
            Image("Gaya")
                .resizable()
                .frame(width: 260, height: 291)
            Image("Pineapple")
                .resizable()
                .frame(width: 90, height: 90)
                .offset(x: 0, y: 100)
        }
        .clipShape(Circle())
        .frame(width: 347, height: 353)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 7)
    }
}

#Preview {
    ProfileImageView()
}
