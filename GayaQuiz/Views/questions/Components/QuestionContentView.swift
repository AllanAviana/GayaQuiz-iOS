//
//  QuestionContentView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct QuestionContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 45) {
            Image(viewModel.gameUiState.image)
                .resizable()
                .frame(width: 213, height: 213)
            
            Text(viewModel.gameUiState.question)
                .font(.custom("Jua-Regular", size: 24))
                .foregroundStyle(Color.white)
                .multilineTextAlignment(.center)
                .frame(height: 55)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 420)
        .background(
            Color(red: 0.290, green: 0.192, blue: 0.180)
        )
        .clipShape(
            RoundedCorner(radius: 26, corners: [.bottomLeft, .bottomRight])
        )
        .shadow(color: Color.black.opacity(0.65), radius: 4, x: 0, y: 4)
    }
}


#Preview {
    QuestionContentView()
}
