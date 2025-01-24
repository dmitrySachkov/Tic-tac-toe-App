//
//  ViewModel.swift
//  Tic-tac-toe App
//
//  Created by Dmitry Sachkov on 23.01.2025.
//

import Foundation
import Observation

@Observable
final class ViewModel {
    var counter: Int = 0
    var images = ["", "", "", "", "", "", "", "", ""]
    var xMarkCounter = [Int]()
    var oMarkCounter = [Int]()
    var winner = ""
    private let winningCombos = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]
    
    
    func getImage(at index: Int) {
        if counter % 2 != 0 {
            images[index] = GameModel.x.imageName
            xMarkCounter.append(index)
        } else {
            images[index] = GameModel.o.imageName
            oMarkCounter.append(index)
        }
    }
    
    func removeImage() {
        if counter % 2 != 0, oMarkCounter.count == 3 {
            let index = oMarkCounter.removeFirst()
            images[index] = ""
        } else if counter % 2 == 0, xMarkCounter.count == 3 {
            let index = xMarkCounter.removeFirst()
            images[index] = ""
        }
    }
    
    func checkWinner() -> Bool {
        let symbol = (counter % 2 != 0) ? GameModel.x.imageName : GameModel.o.imageName
        if isWinning(for: symbol) {
            winner = (symbol == GameModel.x.imageName) ? "X" : "O"
            return true
        }
        return false
    }
    
    func resetGame() {
        images = Array(repeating: "", count: 9)
        xMarkCounter.removeAll()
        oMarkCounter.removeAll()
        winner = ""
        counter = 0
    }
    
    private func isWinning(for symbol: String) -> Bool {
        let indices = images.enumerated().compactMap { $0.element == symbol ? $0.offset : nil }
        return winningCombos.contains { combo in
            combo.allSatisfy(indices.contains)
        }
    }
}
