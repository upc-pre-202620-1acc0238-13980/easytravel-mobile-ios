//
//  OnBoardingView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 18/11/26.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State private var showLoginView = false
    
    var body: some View {
        
        NavigationStack {
            ZStack (alignment: .bottom) {
                
                GeometryReader { geometry in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .overlay {
                    LinearGradient(
                        colors: [
                            .clear, .black],
                        startPoint: .top,
                        endPoint: .bottom)
                }
                .ignoresSafeArea()
                VStack (spacing: 16){
                    
                    Text("Welcome to Easy Travel")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Button {
                        showLoginView.toggle()
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.orange)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.horizontal)
                        
                    }
                }
                
                
            }
            .navigationDestination(isPresented: $showLoginView) {
                LoginView()
            }
        }
    }
    
}

#Preview {
    OnBoardingView()
}
