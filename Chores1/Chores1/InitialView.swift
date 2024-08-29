//
//  InitialView.swift
//  Chores1
//
//  Created by Brunda Basavarajappa on 15/02/24.
//

import SwiftUI

struct InitialView: View {
    
    @Binding var intialViewAppear: Bool
 //   @State private var initialText = "GL"
    @State private var glOpacity = 1.0
    @State private var greenlightOpacity = 0.0
    
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            VStack {
                Text("Gl")
                    .font(.system(size: 40))
                    .opacity(glOpacity)
                Text("Greenlight")
                    .font(.system(size: 40))
                    .opacity(greenlightOpacity)
            }.onAppear(){
                withAnimation(.easeInOut(duration: 1.5)) {
                    glOpacity = 0.0
 
                }
                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: withAnimation(.easeInOut(duration: 1.5)){
//                    greenlightOpacity = 1.0
//                }
//                })
            }
            
        }.onAppear() {
            withAnimation(.easeInOut(duration: 5)) {
                intialViewAppear.toggle()
            }
        }
        
        
    }
}

#Preview {
    InitialView(intialViewAppear: .constant(true))
}
