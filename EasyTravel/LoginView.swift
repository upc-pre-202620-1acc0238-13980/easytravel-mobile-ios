//
//  LoginView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 18/11/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordHidden = true
    
    @State private var showMainView = false
    
    var body: some View {
        VStack (spacing: 16){
            
            TextField("Email", text: $email)
                .frame(height: 24)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            HStack {
                
                Group {
                    if (isPasswordHidden){
                        SecureField("Password", text: $password)
                    } else {
                        TextField("Password", text: $password)
                    }
                }
               
                Button {
                    isPasswordHidden.toggle()
                } label: {
                    Image(systemName: isPasswordHidden ? "eye.slash": "eye")
                }

                
            }
            .frame(height: 24)
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
            
            Button {
                showMainView.toggle()
            } label: {
                Text("Sign in")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $showMainView, destination: {
            MainView()
        })
        .frame(maxHeight: .infinity)
        .tint(.orange)
    }
}


#Preview {
    NavigationStack{
        LoginView()

    }
}
