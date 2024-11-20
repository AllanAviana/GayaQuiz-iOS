//
//  HomeView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(red: 0.427, green: 0.278, blue: 0.259)
                    .ignoresSafeArea()

                VStack(spacing: 30) {

                    TitleTextView(text: "Gaya")

                    ProfileImageView()

                    TitleTextView(text: "Quiz")

                    MyButtonView(
                        word: "Iniciar", onClick: { viewModel.startGame() },
                        navigation: { viewModel.navigationToQuestions() }
                    )

                    .navigationDestination(
                        isPresented: $viewModel.shouldNavigateToQuestions
                    ) {
                        QuestionsView()
                    }
                }.padding(.top, 30)
            }
        }
    }
}
