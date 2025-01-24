//
//  ContentView.swift
//  Tic-tac-toe App
//
//  Created by Dmitry Sachkov on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    @State private var isWin = false
    
    var body: some View {
        if !isWin {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 8) {
                ForEach(0..<9) { index in
                    CardView(imageName: viewModel.images[index])
                        .frame(width: 96, height: 96)
                        .onTapGesture {
                            withAnimation {
                                viewModel.counter += 1
                                viewModel.getImage(at: index)
                                viewModel.removeImage()
                                isWin = viewModel.checkWinner()
                            }
                        }
                }
            }
            .padding([.leading, .trailing], 20)
        } else {
            withAnimation {
                VStack {
                    Image(systemName: "crown.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.red)
                    Text("Winner is \(viewModel.winner)")
                    Button("Restart") {
                        viewModel.resetGame()
                        isWin = false
                    }
                    .frame(width: 150, height: 48)
                    .background(.red)
                    .cornerRadius(12)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
