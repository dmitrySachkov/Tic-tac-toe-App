//
//  Model.swift
//  Tic-tac-toe App
//
//  Created by Dmitry Sachkov on 23.01.2025.
//

import Foundation

enum GameModel {
    case x
    case o
    case empty
    
    var imageName: String {
        switch self {
        case .x:
            return "xmark"
        case .o:
            return "circle"
        case .empty:
            return ""
        }
    }
}
