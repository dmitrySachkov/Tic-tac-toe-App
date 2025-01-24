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
        if counter % 2 == 0 {
            images[index] = GameModel.x.imageName
            xMarkCounter.append(index)
        } else {
            images[index] = GameModel.o.imageName
            oMarkCounter.append(index)
        }
    }
    
    func removeImage() {
        if counter % 2 == 0, oMarkCounter.count == 3 {
            let index = oMarkCounter.removeFirst()
            images[index] = ""
        } else if counter % 2 != 0, xMarkCounter.count == 3 {
            let index = xMarkCounter.removeFirst()
            images[index] = ""
        }
    }
    
    func checkWinner() -> Bool {
        let symbol = (counter % 2 == 0) ? GameModel.x.imageName : GameModel.o.imageName
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
    
//    func checkWinner() -> Bool {
//        if counter % 2 == 0 {
//            if checkXHorizontal() || checkXVertical() || checkXDiagonale() {
//                winner = "X"
//                return true
//            }
//        } else {
//            if checkOHorizontal() || checkOVertical() || checkODiagonale() {
//                winner = "O"
//                return true
//            }
//        }
//        return false
//    }
//    
//    private func checkXHorizontal() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.x.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 1 && indesisy[2] == 2 || indesisy[0] == 3 && indesisy[1] == 4 && indesisy[2] == 5 || indesisy[0] == 6 && indesisy[1] == 7 && indesisy[2] == 8) {
//            return true
//        }
//        return false
//    }
//    
//    private func checkOHorizontal() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.o.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 1 && indesisy[2] == 2 || indesisy[0] == 3 && indesisy[1] == 4 && indesisy[2] == 5 || indesisy[0] == 6 && indesisy[1] == 7 && indesisy[2] == 8) {
//            return true
//        }
//        return false
//    }
//    
//    private func checkXVertical() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.x.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 3 && indesisy[2] == 6 || indesisy[0] == 1 && indesisy[1] == 4 && indesisy[2] == 7 || indesisy[0] == 2 && indesisy[1] == 5 && indesisy[2] == 8) {
//            return true
//        }
//        return false
//    }
//    
//    private func checkOVertical() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.o.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 3 && indesisy[2] == 6 || indesisy[0] == 1 && indesisy[1] == 4 && indesisy[2] == 7 || indesisy[0] == 2 && indesisy[1] == 5 && indesisy[2] == 8) {
//            return true
//        }
//        return false
//    }
//    
//    private func checkXDiagonale() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.x.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 4 && indesisy[2] == 8 || indesisy[0] == 2 && indesisy[1] == 4 && indesisy[2] == 6) {
//            return true
//        }
//        return false
//    }
//    
//    private func checkODiagonale() -> Bool {
//        var indesisy: [Int] = []
//        
//        images.enumerated().forEach { item in
//            if item.element == GameModel.o.imageName {
//                indesisy.append(item.offset)
//            }
//        }
//        
//        if indesisy.count == 3, (indesisy[0] == 0 && indesisy[1] == 4 && indesisy[2] == 8 || indesisy[0] == 2 && indesisy[1] == 4 && indesisy[2] == 6) {
//            return true
//        }
//        return false
//    }
}
