//
//  CoocooPuzzleGame.swift
//  ClimbChickyGame
//
//  Created by alex on 3/12/25.
//


import SwiftUI
import UIKit


struct Puzzle: Identifiable, Equatable {
    var id = UUID()
    var image: Image
    var tag: Int
}

struct CoocooPuzzleGame: View {
    @State private var puzzles = [Puzzle]()
    @State private var selectedPuzzle: Puzzle?
    @State private var showAlert = false


    

    
   
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            let gridWidth = isLandscape ? geometry.size.width * 0.6 : geometry.size.width * 0.95
            
            
            
            
            HStack {
                if isLandscape {
                    
                    VStack(alignment: .center) {
                        
                       
                        
                      
                        
                        VStack(spacing: 20) {
                          
                            Button(action: {
                                puzzles = []
                                createPuzzles()
                            }, label: {
                                Image(systemName: "arrow.counterclockwise")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            })
                        }
                        .padding()
                        
                    }
                    
                    
                    .frame(width: 80, height: 80)
                    //.background(.ultraThinMaterial)
                    
                    
                    .padding(.leading, 80)
                }
                if isLandscape {
                    Spacer()
                }
                VStack {
                    if !isLandscape {
                        
                        
                        Spacer()
                    }
                    LazyVGrid(columns: columns) {
                        ForEach(puzzles) { puzzle in
                            puzzle.image
                                .resizable()
                                .opacity(puzzle.id == selectedPuzzle?.id ? 0.5 : 1)
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture {
                                    handleTap(for: puzzle)
                                }
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .frame(width: gridWidth)
                    
                    if !isLandscape {
                        Spacer()
                        HStack {
                           
                            
                            Button(action: {
                                puzzles = []
                                createPuzzles()
                            }, label: {
                                Image(systemName: "arrow.counterclockwise")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            })
                        }
                        .padding()
                        
                    }
                    
                }
                if isLandscape {
                    Spacer()
                }
            }
            .overlay(
                ZStack {
                    Image(.back)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .position(x: geometry.size.width / 15, y: geometry.size.height / 40)
                        .onTapGesture {
                            NavGuard.shared.currentScreen = .MENU
                        }
                }
            )
            .animation(.easeInOut, value: puzzles)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("You won!"), dismissButton: .default(Text("OK")))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
//                LottieView(filename: "background")
//                    .frame(width: geometry.size.width, height: geometry.size.height)
            )
            
            .onAppear {
                
                createPuzzles()
            }
        }
       
        .animation(.bouncy, value: selectedPuzzle)
//        .sheet(isPresented: $showMenu, content: {
//            GeometryReader { geo in
//                MainPuzzleScreen(isLoading: $isLoading, showMenu: $showMenu, lastWasPolicy: $lastWasPolicy)
//                //.interactiveDismissDisabled()
//            }
//            
//        })
        
        
    }
    
    @MainActor private func createPuzzles() {
        
        let image = Image("puzzle\(Int.random(in: 1...3))")
        let renderer = ImageRenderer(content: image)
        
        if let uiImage = renderer.uiImage {
            let width = uiImage.size.width / 3
            let height = uiImage.size.height / 3
            
            for row in 0..<3 {
                for col in 0..<3 {
                    let rect = CGRect(x: CGFloat(col) * width, y: CGFloat(row) * height, width: width, height: height)
                    if let cgImage = uiImage.cgImage?.cropping(to: rect) {
                        let croppedUIImage = UIImage(cgImage: cgImage)
                        let croppedImage = Image(uiImage: croppedUIImage)
                        let tag = row * 3 + col
                        puzzles.append(Puzzle(image: croppedImage, tag: tag))
                    }
                }
            }
            
            puzzles.shuffle()
        }
    }
    
    private func handleTap(for puzzle: Puzzle) {
        if selectedPuzzle == nil {
            selectedPuzzle = puzzle
        } else {
            swapPuzzles(puzzle)
            selectedPuzzle = nil
            checkIfSolved()
        }
    }
    
    private func swapPuzzles(_ puzzle: Puzzle) {
        if let index1 = puzzles.firstIndex(where: { $0.id == selectedPuzzle?.id }),
           let index2 = puzzles.firstIndex(where: { $0.id == puzzle.id }) {
            withAnimation {
                puzzles.swapAt(index1, index2)
            }
        }
    }
    
    private func checkIfSolved() {
        if puzzles.enumerated().allSatisfy({ $0.element.tag == $0.offset }) {
            //  AppData.shared.userData.value?.score += 10
            showAlert = true
            puzzles = []
            createPuzzles()
        }
    }
}

#Preview {
    CoocooPuzzleGame()
}
