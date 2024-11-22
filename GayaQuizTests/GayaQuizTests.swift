//
//  GayaQuizTests.swift
//  GayaQuizTests
//
//  Created by Allan Viana on 18/11/24.
//

import XCTest
@testable import GayaQuiz

class GayaQuizTests: XCTestCase {

    var viewModel: ViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testStartGame() {

        viewModel.startGame()

        XCTAssertNotNil(viewModel.gameUiState.question, "The question must be initialized.")
        
        XCTAssertEqual(viewModel.gameUiState.options.count, 4, "There must be exactly 4 options.")
        
        XCTAssertTrue(viewModel.gameUiState.options.contains(viewModel.gameUiState.answer), "The correct answer must be among the options.")
    }

    func testUpdateGameWithCorrectAnswer() {
        viewModel.startGame()
        let correctAnswer = viewModel.gameUiState.answer
        let initialScore = viewModel.resultUiState.score

        viewModel.updateGame(correctAnswer)

        XCTAssertEqual(viewModel.resultUiState.score, initialScore + 10, "The score should have increased by 10.")

        XCTAssertNotEqual(viewModel.gameUiState.question, "", "A new question should have been generated.")
        XCTAssertTrue(viewModel.useds.contains(viewModel.gameUiState.question), "The current question should be in the list of used questions.")
    }

    func testUpdateGameWithIncorrectAnswer() {
        viewModel.startGame()
        let incorrectAnswer = "Wrong Answer"
        let initialScore = viewModel.resultUiState.score

        viewModel.updateGame(incorrectAnswer)

        XCTAssertEqual(viewModel.resultUiState.score, initialScore, "The score should not have changed.")

        XCTAssertNotEqual(viewModel.gameUiState.question, "", "A new question should have been generated.")
        XCTAssertTrue(viewModel.useds.contains(viewModel.gameUiState.question), "The current question should be in the list of used questions.")
    }

    func testUpdateGameNavigatesToResultAfterMaxQuestions() {
        viewModel.count = 11
        viewModel.resultUiState.score = 50

        viewModel.updateGame(viewModel.gameUiState.answer)

        XCTAssertTrue(viewModel.shouldNavigateToResult, "It should navigate to the results screen.")

        XCTAssertEqual(viewModel.resultUiState.image, "SadGaya", "The image should be SadGaya.")
        XCTAssertEqual(viewModel.resultUiState.phrase, "You have disappointed Gaya.", "The phrase should match the score.")
    }
}
