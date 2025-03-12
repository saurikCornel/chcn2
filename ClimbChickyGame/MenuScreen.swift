//
//  MenuView.swift
//  ClimbChickyGame
//
//  Created by alex on 3/12/25.
//

import Foundation
import SwiftUI


struct MenuScreen: View {
    @State var showRankingSheet = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                VStack {
                    Spacer()
                    Image(.bottomStaff)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.8)
                        .frame(width: geometry.size.width)
                }
                .ignoresSafeArea()
                
                Image(.clouds)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.5)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.3)
                
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.1)
                
              
               
                VStack {
                    HStack {
                        Spacer()
                        Image(.chickkenhidden)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .rotationEffect(.degrees(200))
                            .ignoresSafeArea()
                            .offset(x: 50, y: -50)
                    }
                    Spacer()
                    HStack {
                        Image(.chickkenhidden)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .rotationEffect(.degrees(25))
                            .ignoresSafeArea()
                            .offset(x: -100, y: 50)
                        Spacer()
                    }
                }
                .ignoresSafeArea()
                
                
                VStack  {
                    Spacer()
                    Button {
                        NavGuard.shared.currentScreen = .CLIMBGAME
                    } label: {
                        Image(.climbbtn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    .frame(height: 120)
                    
                    Button {
                        NavGuard.shared.currentScreen = .RUNCHICKYGAME
                    } label: {
                        Image(.runChickyBtn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    .frame(height: 120)
                    
                    Button {
                        NavGuard.shared.currentScreen = .COCOPUZZLEGAME
                    } label: {
                        Image(.cocopuzzlebtn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    .frame(height: 120)
                    
                    Spacer()
                    
                    Button {
                        showRankingSheet.toggle()
                    } label: {
                        Text("About Us")
                            .foregroundColor(.white)
                            .shadow(radius: 20)
                    }

                    
                

                }
                .padding(.top, geometry.size.height * 0.1)
                
                
                
             
                
            }
            
        }
        .sheet(isPresented: $showRankingSheet) {
            RankingView()
        }
        .background(
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
        )
    }
}

#Preview {
    MenuScreen()
}
