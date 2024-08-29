//
//  ContentView.swift
//  Trial1W
//
//  Created by Brunda Basavarajappa on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.gray1)
                .frame(width: 400, height: 250)
                .edgesIgnoringSafeArea(.all)
            
            Text("Chores")
                .frame(width: 350, height: 80, alignment: .bottomLeading)
                .font(.system(size: 50, weight: .regular ))
    
        }
        
        ScrollView(showsIndicators: false) {
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
                    .shadow(radius: 40)
                
                VStack {
                    
                    ChoreDetail(dayAndDate: "Sunday, Dec 31", workDesigned: "Vaccum around the house")
                    ChoreDetail(dayAndDate: "Saturday, Jan 1", workDesigned: "Car Wash")
                    ChoreDetail(dayAndDate: "Sunday, Jan 2", workDesigned: "Clean the bathroom")
                    ChoreDetail(dayAndDate: "Monday,Jan 3",workDesigned: "Clean the backyard")
                    
                }
            }
        }
            
        
        
        Button {
            print("Tapped")
        }
    label:{
            Text("Add chores")
                .frame(width: 300,height: 50)
                .background(Color.addChoreGreen)
                .foregroundColor(.black)
                .font(.system(size: 20,weight: .bold,design: .default))
                .cornerRadius(10)
        }
        
        
        
        Spacer()
    }
}

#Preview {
    ContentView()
}

