//
//  WheatherButton.swift
//  Trial
//
//  Created by Brunda Basavarajappa on 27/01/24.
//

import SwiftUI

struct ButtonView: View {
            
            var buttonText: String
            var bgcolor: Color
            var fgcolor: Color
            
var body: some View {
    
                Text(buttonText)
                    .frame(width: 280,height: 50)
                    .background(bgcolor)
                    .foregroundColor(fgcolor)
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .cornerRadius(10)
            }
        }
    

#Preview {
    ButtonView(buttonText: "Change the date and time", bgcolor: .white, fgcolor: .blue)
}


