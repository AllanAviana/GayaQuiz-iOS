//
//  ResultMessageView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct ResultMessageView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        Text(viewModel.resultUiState.phrase)
            .foregroundStyle(Color.white)
            .font(.custom("Jua-Regular", size: 36))
            .padding(.top, 10)
    }
}
