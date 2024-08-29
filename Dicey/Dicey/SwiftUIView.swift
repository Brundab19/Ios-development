//
//  SwiftUIView.swift
//  Dicey
//
//  Created by Brunda Basavarajappa on 21/04/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State var rotatingValue: CGFloat = 270.0
    @State var trimValue: CGFloat = 0
    @State var finalValue: CGFloat = 0
    @State var isRotating = 0.0
    @Binding var animating: Bool
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.1)
                    .foregroundColor(.clear)
                Circle()
                    .trim(from: trimValue, to: finalValue)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: rotatingValue))
            }
            .rotationEffect(Angle(degrees: isRotating))
            .onAppear {
                animateView()
            }
        }
    }
    
    @discardableResult
    func animateView() -> Bool {
        guard animating else { return false }
        Task {
            withAnimation(.linear(duration: 0.5)
                .speed(0.2)
                .repeatForever(autoreverses: false)) {
                    isRotating = 360
                }
            while true {
                trimValue = 0
                finalValue = 0.1
                rotatingValue = 270
            }
        }
        return true
    }
    
}

#Preview {
    SwiftUIView(rotatingValue:  5, trimValue: 0, finalValue: 0, isRotating: 20, animating: .constant(true))
}
