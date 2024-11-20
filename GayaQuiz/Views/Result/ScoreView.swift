//
//  ScoreView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var viewModel: ViewModel
    var width: CGFloat

    var body: some View {
        Text("Score: \(viewModel.resultUiState.score)")
            .font(.custom("Jua-Regular", size: 70))
            .foregroundStyle(Color.white)
            .frame(width: width, height: 72)
            .background(
                Color(red: 69 / 255, green: 45 / 255, blue: 42 / 255)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
