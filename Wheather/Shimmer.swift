//
//  Shimmer.swift
//  Trial
//
//  Created by Brunda Basavarajappa on 13/07/24.
//

import SwiftUI

struct Shimmer: View {
    var body: some View {
        VStack {
                
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 20)
                            .overlay(ShimmerView().cornerRadius(10))
                            .padding(.vertical, 4)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .overlay(ShimmerView().cornerRadius(10))
                .padding(.vertical, 4)
                
                }
                .padding()
    }
}

#Preview {
    Shimmer()
}


struct ShimmerView: View {
    @State private var phase: CGFloat = 0

    var body: some View {
        
        LinearGradient(colors: [.black, .red, .orange, .purple, .lightblue, . blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    ShimmerView()
}
