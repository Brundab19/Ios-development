//
//  ContentView.swift
//  Chores1
//
//  Created by Brunda Basavarajappa on 28/01/24.
//

import SwiftUI


struct ContentView: View {

@State private var choreArray = [Chore(title: "Clean the house", descp: "clean the house neatly", inst: "take the required steps", dueDate: "Friday jan 1", arrayOfChores: ["clean the shelf","clean the colony"], createdDate: "2000-1-2", isComplete: false),Chore(title: "Clean the yard", descp: "clean it", inst: "doit", dueDate: "Saturday jan 2", arrayOfChores: ["clean th valley" ], createdDate: "2000-2-1", isComplete: false),Chore(title: "Clean the room", descp: "cleaning the room", inst: "Arrange your books in the bookself", dueDate: "Sunday jan 2", createdDate: "Monday 2000-3-4", isComplete: false)]
        

    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.glgray)
                .frame(width: 400, height: 250)
                .edgesIgnoringSafeArea(.all)
            
            Text("Chores")
                .frame(width: 350, height: 80, alignment: .bottomLeading)
                .font(.system(size: 50, weight: .regular ))
    
        }
            
        
        ScrollView(showsIndicators: false) {
            
            
            VStack {
                
                
                ForEach($choreArray){
                    $chorevalue in
                    
                    VStack{
                        
                        Divider()
                        
                        Text(chorevalue.dueDate)
                            .frame(width: 350 , alignment: .leading)
                            .padding(.all)
                            .font(.system(size: 20,weight: .semibold))
                       
                        
                        HStack{
                        
                            Image(systemName: chorevalue.isComplete ? "checkmark.square" : "square")
                                .padding(.horizontal)
                                .onTapGesture {
                                    chorevalue.isComplete.toggle()
                                }
                            Spacer()
                            
                            ZStack{
                                
                                Text(chorevalue.title)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Image(systemName: chorevalue.isComplete ? "minus" : "" )
                                    .resizable()
                                    .opacity(0.8)
                                    .frame(width: 150, height: 5)
                            }
                            
                            
                            HStack {
                                
                                Spacer()
                                
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundColor(.glgreen)
                                    .font(.system(size: 20))
                                    .padding(.horizontal)
                                
                                Image(systemName: "ellipsis.circle.fill")
                                    .font(.system(size: 20))
                                    .padding(.horizontal)
                                
                            }
                        }
                        
                        
                        Text(chorevalue.descp)
                            .frame(width: 280, alignment: .leading)
                        Divider()
                            .padding()
                    }
                    
                }
            }
            
        }
        Spacer()
        
        
        Button {
            print("Tapped")
        }
        label:{
            Text("Add chores")
                .frame(width: 300,height: 50)
                .background(Color.glgreen)
                .foregroundColor(.black)
                .font(.system(size: 20,weight: .bold,design: .default))
                .cornerRadius(10)
        }
        
    
    }
}

#Preview {
    ContentView()
}
