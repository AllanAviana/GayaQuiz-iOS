//
//  TitleTextView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct TitleTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Jua-Regular", size: 64))
            .foregroundStyle(Color.white)
    }
}
