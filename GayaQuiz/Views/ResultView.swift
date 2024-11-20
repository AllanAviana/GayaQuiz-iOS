//
//  ResultView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 19/11/24.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color(red: 0.427, green: 0.278, blue: 0.259)
                    .ignoresSafeArea()

                VStack(spacing: 30) {

                    ScoreView(width: geometry.size.width * 0.92)

                    ResultImageView()

                    ResultMessageView()

                    MyButtonView(
                        word: "Voltar", onClick: { viewModel.resetGame() },
                        navigation: { viewModel.navigationToHome() }
                    )

                    .navigationDestination(
                        isPresented: $viewModel.shouldNavigateToHome
                    ) {
                        HomeView()
                    }

                }.padding(.top, 40)
            }
        }
    }
}
