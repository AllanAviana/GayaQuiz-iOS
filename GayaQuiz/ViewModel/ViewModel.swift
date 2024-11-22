//
//  ViewModel.swift
//  GayaQuiz
//
//  Created by Allan Viana on 19/11/24.
//

import Combine
import SwiftUI

class ViewModel: ObservableObject {

    @Published var gameUiState: GameUiState = GameUiState()
    @Published var resultUiState: ResultUiState = ResultUiState()
    @Published var shouldNavigateToResult = false
    @Published var shouldNavigateToQuestions = false
    @Published var shouldNavigateToHome = false
    
    var count: Int = 0
    var useds: [String] = []

    let gayaQuestions: [String: [String]] = [
        "Qual é o nome do irmão da Gaya?": ["Bob", "Max", "Rocky", "Bart"],
        "Qual animal a Gaya comeu?": ["Pássaro", "Peixe", "Gato", "Rato"],
        "Qual é o nome do pai da Gaya?": ["Thor", "Lucky", "Rex", "Bidu"],
        "Qual foi o primeiro brinquedo da Gaya?": [
            "Bola", "Pelúcia", "Osso", "Corda",
        ],
        "Quantos anos a Gaya tinha quando foi castrada?": [
            "2", "3", "6 meses", "1",
        ],
        "Qual é o nome da mãe da Gaya?": ["Luna", "Bella", "Nina", "Cocota"],
        "Onde a Gaya nasceu?": [
            "São Paulo", "Rio de Janeiro", "Belo Horizonte", "Campo Grande",
        ],
        "Qual é o tipo de brinquedo favorito da Gaya?": [
            "Bola", "Pelúcia", "Corda", "Espinhoso",
        ],
        "Em qual dia a Gaya nasceu?": ["15", "18", "22", "20"],
        "Qual desses truques a Gaya não sabe?": [
            "Sentar", "Ficar", "Deitar", "Dar a pata",
        ],
        "Quantos anos a Gaya tem?": ["1", "5", "4", "3"],
        "Qual é o nome de batismo da Gaya?": [
            "Luna", "Estrela", "Sol", "Maria",
        ],
    ]
    
    

    func startGame(){
        
        image()
        
        let availableKeys = gayaQuestions.keys.filter { !useds.contains($0) }

        guard let randomKey = availableKeys.randomElement(),
            let values = gayaQuestions[randomKey]
        else {
            return
        }
        print(randomKey)
        
        gameUiState.options = [values[0], values[1], values[2], values[3]].shuffled()
        gameUiState.answer = values[3]
        gameUiState.question = randomKey
        useds.append(randomKey)
    }
    
    func navigationToQuestions(){
        shouldNavigateToQuestions = true        
    }
    
    func updateGame(_ word: String){
        if word == gameUiState.answer{
            resultUiState.score += 10
            image()
        }
        if count < 11 {
                startGame()
                count += 1
                print("Game started. Current count: \(count)")
            } else {
                shouldNavigateToResult = true
                resultImage()
                print("Game over. Navigating to result.")
            }
    }
    
    func image(){
        let numbers = [1,2]
        
        if numbers.randomElement() == 1 {
            gameUiState.image = "QuestionImage"
        }else{
            gameUiState.image = "QuestionImage2"
        }
    }
    
    func resultImage(){
        if resultUiState.score <= 40 {
            resultUiState.image = "AngryGaya"
            resultUiState.phrase = "Você foi terrível!!"
        }else if resultUiState.score <= 80{
            resultUiState.image = "SadGaya"
            resultUiState.phrase = "Decepcionaste a Gaya."

        }else{
            resultUiState.image = "AngelGaya"
            resultUiState.phrase = "Fez o minimo."
        }
    }
    
    func navigationToHome(){
        shouldNavigateToHome = true
        shouldNavigateToHome = false
    }
    
    func resetGame(){
        resultUiState = ResultUiState()
        useds = []
        count = 0
        shouldNavigateToResult = false
        shouldNavigateToQuestions = false
            }

}
