//
//  GameUiState.swift
//  GayaQuiz
//
//  Created by Allan Viana on 19/11/24.
//

import SwiftUI

struct GameUiState{
    var answer: String = ""
    var options: [String] = []
    var image: String = ""
    var question: String = ""
}

extension GameUiState: Equatable{
     public static func == (lhs: GameUiState, rhs: GameUiState) -> Bool {
        return lhs.answer == rhs.answer
        && lhs.options == rhs.options
        && lhs.image == rhs.image
        && lhs.question == rhs.question
    }
}
