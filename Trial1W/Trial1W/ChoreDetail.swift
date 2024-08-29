//
//  ChoreDetail.swift
//  Trial1W
//
//  Created by Brunda Basavarajappa on 26/01/24.
//

import SwiftUI

struct ChoreDetail: View {
    
    var dayAndDate : String
    var workDesigned : String
    
    var body: some View {
      
        
            VStack {
                Text(dayAndDate)
                    .frame(width: 350, alignment:.bottomLeading)
                    .padding()
                
                VStack{
                    
                    HStack {
                        
                        Text(workDesigned)
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 290, alignment: .bottomLeading)
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.glgreen)
                            .font(.system(size: 20))
                        
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.system(size: 20))
                        
                    }
                    Text("Complete this task daily")
                        .frame(width: 350, alignment: .bottomLeading)
                }
                //  .padding()
                // .border(.gray1, width: 2)
            }
            
            .padding()
            
            .border(.gray1,width: 2)
        
    }
}

#Preview {
    ChoreDetail(dayAndDate: "jan 1", workDesigned: "sunday")
}
