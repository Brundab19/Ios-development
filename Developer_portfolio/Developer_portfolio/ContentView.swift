//
//  ContentView.swift
//  Developer_portfolio
//
//  Created by Brunda Basavarajappa on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack{
            Color(.angelagreen)
                .ignoresSafeArea(.all)
            
            VStack{
                Image(systemName: "circle")
                    .foregroundColor(.white)
                    .font(.system(size: 200))
                
                Text("ANgela YU")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 35))
                Text("IOS Developer")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20))
                
                Button{
                    print("Touched")
                }label: {
                    Image(systemName: "phone")
                    Text("+44 - 899034343")
                }
                .frame(width: 330,height: 50)
                .background()
                .cornerRadius(22)
                .padding()
                
                Button{
                    print("tipped")
                }label: {
                    Image(systemName:"message")
                    Text("email@angela.com")
                }
                .frame(width: 330,height: 50)
                .background()
                .cornerRadius(22)
                
            }
            
            Spacer()
        }
        
        Spacer()
        
        
    }
}

#Preview {
    ContentView()
}
