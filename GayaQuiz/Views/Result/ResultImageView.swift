//
//  ResultImageView.swift
//  GayaQuiz
//
//  Created by Allan Viana on 20/11/24.
//

import SwiftUI

struct ResultImageView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        Image(viewModel.resultUiState.image)
            .resizable()
            .frame(width: 356, height: 362)
    }
}
