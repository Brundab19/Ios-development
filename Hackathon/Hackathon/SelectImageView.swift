//
//  SelectImageView.swift
//  Hackathon
//
//  Created by Brunda Basavarajappa on 21/06/24.
//

import SwiftUI

struct SelectImageView: View {
    
    @EnvironmentObject private var routemanager : NavigationRouter
    @State var image: UIImage?
    @State var screenW = 0.0
    @State var scale = 1.0
    @State var lastScale = 0.0
    @State var offset: CGSize = .zero
    @State var lastOffset: CGSize = .zero
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    CommonHeaderView(title: "Place your image", subTitle: "We recommend making your image larger than the card's surface")
                }
                .padding()
                ZStack {
                    Image(uiImage: image ?? .guitar)
                        .resizable()
                        .scaleEffect(scale)
                        .offset(offset)
                        .scaledToFill()
                        .frame(width: screenW, height: screenW)
                        .clipped()
                        .gesture(
                            MagnificationGesture(minimumScaleDelta: 0)
                                .onChanged({ value in
                                    withAnimation(.interactiveSpring()) {
                                        scale = handleScaleChange(value)
                                    }
                                })
                                .onEnded({ _ in
                                    lastScale = scale
                                })
                                .simultaneously(
                                    with: DragGesture(minimumDistance: 0)
                                        .onChanged({ value in
                                            withAnimation(.interactiveSpring()) {
                                                offset = handleOffsetChange(value.translation)
                                            }
                                        })
                                        .onEnded({ _ in
                                            lastOffset = offset
                                        })
                                    
                                )
                        )
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black.opacity(0.5))
                            .frame(width: 380, height: 350)
                        RoundedRectangle(cornerRadius: 13)
                            .frame(width: 300, height: 200)
                            .blendMode(.destinationOut)
                            .overlay(RoundedRectangle(cornerRadius: 13).stroke(.white, lineWidth: 5))
                    }
                    .compositingGroup()
                }
                
                
                LazyVGrid(columns: columns) {
                    PhotoEditButtonView(title: "Rotate Image", onclick: {}, imageTitle: "arrow.triangle.2.circlepath")
                    PhotoEditButtonView(title: "Reset Photo", onclick: {
                    }, imageTitle: "person.crop.square")
                    PhotoEditButtonView(title: "Change Photo", onclick: {
                    }, imageTitle: "photo")
                }
                
                RectangleFullScreenButton(text: "Done", textColor: .white, buttonColor: .glDarkGreen) {
                    routemanager.push(to: .CardView(title: "gldebit"))
                }
                .padding(.top,20)
            }
            .onAppear {
                screenW = geometry.size.width
            }
        }
    }
    private func handleScaleChange(_ zoom: CGFloat) -> CGFloat {
        lastScale + zoom - (lastScale == 0 ? 0 : 1)
    }
    
    private func handleOffsetChange(_ offset: CGSize) -> CGSize {
        var newOffset: CGSize = .zero
        
        newOffset.width = offset.width + lastOffset.width
        newOffset.height = offset.height + lastOffset.height
        
        return newOffset
    }
}

#Preview {
    SelectImageView()
}
