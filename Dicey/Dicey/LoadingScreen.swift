//
//  LoadingScreen.swift
//  Dicey
//
//  Created by Brunda Basavarajappa on 21/04/24.
//

import SwiftUI

struct Cv: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            // Main content
            Color.white
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Text("Your Main Content")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                )
            
            // Loading overlay
            if isLoading {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Text("Loading...")
                                .font(.title)
                                .foregroundColor(.white)
                            Button {
                                
                            }
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                    )
            }
        }
        .onAppear {
            // Simulate loading after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = true
            }
        }
    }
}

#Preview {
    Cv(isLoading: .init())
}
