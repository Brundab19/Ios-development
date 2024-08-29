//
//  ContentView.swift
//  Dicey
//
//  Created by Brunda Basavarajappa on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack{
//                Image("diceeLogo")
//                    .padding(.bottom)
                HStack{
                    dice(number: leftDiceNumber)
                        .padding()
                    dice(number: rightDiceNumber)
                        .padding()
                }
                .padding()
               
                Button{
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }label:{
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(.buttonred)
                
               
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct dice: View {
    
    var number: Int
    
    
    var body: some View {
        Image("dice\(number)").resizable()
            .aspectRatio(1,contentMode: .fit)
            .frame(width: 150)
    }
}

#Preview {
    dice(number: 5)
}
