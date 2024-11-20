//
//  MyButtonView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct MyButtonView: View {
    var word: String
    var onClick: () -> Void
    var navigation: () -> Void

    var body: some View {
        Button(action: {
            onClick()
            navigation()
        }) {
            Text(word)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 294, height: 64)
                .background(
                    Color(red: 0.290, green: 0.192, blue: 0.180)
                )
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color(red: 0.247, green: 0.157, blue: 0.145),
                            lineWidth: 4)
                )
                .padding(.top, 10)
        }
    }
}
