// ContentView.swift
// Testgame
// Created by alex on 3/6/25

import SwiftUI
import WebKit
import StoreKit

// Представление WKWebView для SwiftUI
struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
   
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
  
    @State private var showRankingSheet = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                if let url = URL(string: "https://climbandchicky.top/play") {
                    ZStack {
                        WebView(url: url)
                            .clipped()
                        
//                        VStack {
//                            HStack {
//                                Spacer()
//                                Button {
//                                    showRankingSheet = true
//                                } label: {
//                                    Image(.plusBtn)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 30)
//                                }
//                                .padding()
//                                Spacer()
//                            }
//                            Spacer()
//                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color(hex: "232654").ignoresSafeArea())
            .overlay(
                ZStack {
                    Image(.back)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .position(x: geo.size.width / 15, y: geo.size.height / 40)
                        .onTapGesture {
                            NavGuard.shared.currentScreen = .MENU
                        }
                }
            )
        }
        
       
    }
}

struct RankingView: View {
    let developers = [
        ("CartoonMaster Alex", 101),
        ("PixelPusher Bob", 99),
        ("CodeWizard Chris", 97),
        ("DesignDiva Dana", 95),
        ("BugBlaster Eve", 93),
        ("UI_Unicorn Finn", 91),
        ("JSSorcerer Gia", 89),
        ("GameGuru Hank", 87),
        ("AnimationAce Ivy", 85),
        ("TechTickler Jon", 83)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                
                VStack(spacing: 15) {
                    // Close button
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold))
                        }
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                    }
                    
                    Text("Our coders")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt", size: 36))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .minimumScaleFactor(0.5) // Shrink if needed
                        .lineLimit(1)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(developers, id: \.0) { (name, score) in
                                HStack {
                                    Spacer()
                                    Text(name)
                                        .foregroundColor(.white)
                                        .font(.custom("Marker Felt", size: 20))
                                        .lineLimit(1)
                                    Spacer()
//                                    Text("\(score)")
//                                        .foregroundColor(.white)
//                                        .font(.custom("Marker Felt", size: 20))
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                    .frame(width: geometry.size.width) // Limit ScrollView height
                    
                    Spacer()
                    
                    Button(action: {
                        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                            SKStoreReviewController.requestReview(in: scene)
                        }
                    }) {
                        Text("Rate Us!")
                            .foregroundColor(.white)
                            .font(.custom("Marker Felt", size: 24))
                            .padding()
                            .frame(maxWidth: geometry.size.width * 0.8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.4))
                            )
                    }
                    .padding(.bottom, 20)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}



#Preview {
    ContentView()
}
