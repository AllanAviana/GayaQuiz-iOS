//
//  AnswerOptionsView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct AnswerOptionsView: View {
    @EnvironmentObject var viewModel: ViewModel
    var spacing: CGFloat

    var body: some View {
        VStack(spacing: spacing) {
            ForEach(viewModel.gameUiState.options, id: \.self) { option in
                MyButtonView(word: option, onClick: {
                    viewModel.updateGame(option)
                }, navigation: {})
            }
        }
        .navigationDestination(isPresented: $viewModel.shouldNavigateToResult) {
            ResultView()
        }
    }
}
