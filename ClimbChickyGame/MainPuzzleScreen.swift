//
//  MainPuzzleScreen.swift
//  ClimbChickyGame
//
//  Created by alex on 3/12/25.
//

import Foundation

import SwiftUI

struct MainPuzzleScreen: View {
    @Binding var isLoading: Bool
    @Binding var showMenu: Bool
    @State var showPolicy = false
    @Binding var lastWasPolicy: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack {
               
                    Color.black
                    Image("background")
                    //LottieView(filename: "background-menu")
                        .frame(width: geometry.size.width, height: geometry.size.height).opacity(0.6)
                    
                    VStack {
                        if isLoading {
//                            LottieView(filename: "loading")
//                                .frame(width: 300, height: 250)
                            
                        } else {
                            VStack {
                                
                               
                                
                                Spacer()
                                Button(action: {
                                    showMenu = false
                                }, label: {
                                    HStack {
                                        Text("Play")
                                            .font(.system(size: 50, weight: .heavy))
                                            .foregroundColor(.white)
                                        Image(systemName: "gamecontroller")
                                            .font(.system(size: 50, weight: .heavy))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                                })
                                Spacer()
                                Button(action: {
                                    showPolicy = true
                                    lastWasPolicy = true
                                }, label: {
                                    Text("Policy")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                })
                                
                            }
                            .padding()
                        }
                    
                }
                
            }
           
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainPuzzleScreen(isLoading: .constant(false), showMenu: .constant(true), lastWasPolicy: .constant(false))
}
