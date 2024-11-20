//
//  QuestionsView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 18/11/24.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color(red: 0.427, green: 0.278, blue: 0.259)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    QuestionContentView()
                    
                    Spacer().frame(height: geometry.size.height * 0.05)
                    
                    AnswerOptionsView(spacing: geometry.size.height * 0.03)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}
