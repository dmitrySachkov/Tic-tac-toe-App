//
//  CardView.swift
//  Tic-tac-toe App
//
//  Created by Dmitry Sachkov on 23.01.2025.
//

import SwiftUI

struct CardView: View {
    
    var imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
            Image(systemName: imageName)
                .resizable()
                .foregroundStyle(.white)
                .padding(10)
        }
    }
}

#Preview {
    CardView(imageName: "circle")
}
