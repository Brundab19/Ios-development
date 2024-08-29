//
//  SelectedCardView.swift
//  Hackathon
//
//  Created by Brunda Basavarajappa on 17/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SelectedCardView: View {
    
    @EnvironmentObject private var routemanager : NavigationRouter
    

    var imageTitle : String = mockImageURL
    var image: UIImage?
    var body: some View {
        
        VStack() {
            
            Image(systemName:"chevron.backward")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
                .foregroundColor(Color.glDarkGreen)
                .onTapGesture {
                    routemanager.goBack()
                }
            
            CommonHeaderView(title: "How's it looking?", subTitle: "You can  use this design - or keep editing until its just what you pictured")
            
            HStack {
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(10)
                }
                else {
                    if(imageTitle.count>20){
                        WebImage(url: URL(string: imageTitle), content: { image in
                            image.resizable().scaledToFit()
                        }, placeholder: {
                            ProgressView()
                        })
                    }
                    else{
                        Image(imageTitle)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(10)
                    }
                }
            }
            
            List{
                HStack() {
                    Image(systemName:"checkmark.circle")
                    Text("Make sure you have permission to use the photo\nif others appear on it")
                        .font(.caption)
                        .fontWeight(.light)
                        .offset(CGSize(width: 10.0, height: 5.0))
                }
                .listRowSeparator(.hidden)
                HStack {
                    Image(systemName:"checkmark.circle")
                    Text("Avoid trademarks, such as brand logos, sports teams, & characters from TV, movies or comics")
                        .font(.caption)
                        .fontWeight(.light)
                        .offset(CGSize(width: 10.0, height: 5.0))
                    
                }
                .padding(.bottom,10)
            }
            .padding(.horizontal, -6)
            .padding(.top, -20)
            .padding(.bottom, -90)
            
            RectangleFullScreenButton(text : "Order This Card", textColor: Color.white, buttonColor: Color.glDarkGreen, buttonOnClick: { routemanager.push(to: NavigationEnum.Checkout) })
                .padding(.bottom, 30)
            
            RectangleFullScreenButton(text : "Keep Editing", textColor: Color.black, buttonColor: Color.white, shadowRadius: CGFloat(2), buttonOnClick: { routemanager.goBack()})
                .padding(.bottom, 30)
        }
        .background(Color.glgrey2)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SelectedCardView()
        .environmentObject(NavigationRouter())
}

