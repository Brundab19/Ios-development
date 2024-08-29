//
//  ContentViewWithAPI.swift
//  Hackathon
//
//  Created by Chandan Kasamsetty on 22/06/24.
//

import SwiftUI
import SDWebImageSwiftUI


//struct ImageView: View {
//    @ObservedObject private var imageViewModel: ImageViewModel
//    
//    init(urlString: String?) {
//        imageViewModel = ImageViewModel(urlString: urlString)
//    }
//    
//    var body: some View {
//        Image(uiImage: imageViewModel.image ?? UIImage())
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            
//    }
//}

struct CustomImageGridWithTitleAPI: View {
    @EnvironmentObject private var routemanager : NavigationRouter
    
    var Title : String? = ""
    var ImageList : Array<String> = Array(repeating: "SampleDesignCard", count: 10)
    let rows = [
        GridItem(),
        GridItem()
    ]
    
    
    var body: some View {
        Text(Title ?? "")
            .frame(width: 340, alignment: .leading)
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(ImageList.indices, id: \.self) { item in
                    NavigationLink(value: NavigationEnum.CardView(title: ImageList[item]), label: {
                        WebImage(url: URL(string: ImageList[item]), content: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }, placeholder: {
                            ProgressView()
                        })
                            
                   })
                        
                }
            }
            .frame(height: 136)
            .padding(.bottom)
        }
    }
}

struct ContentViewWithAPI: View {
    
    @EnvironmentObject private var routemanager : NavigationRouter
    @StateObject private var viewModel = GalleryViewModel()
    @State private var error: GalleryViewModel.UserError?
    @State private var hasError = false
    var cnt = 1
    @State var pickAnImage = true
    @State var backgroundColorForButton1: Color = .glgray
    @State var backgroundColorForButton2: Color = .white
    @State var backgroundColorForButton3: Color = .white
    @State var foregroundColorForButton1: Color = .white
    @State var foregroundColorForButton2: Color = .black
    @State var foregroundColorForButton3: Color = .black
    
    @State var title = "Pick an Image"
    @State var subTitle = "Get a card that that looks fun, at just $9.99"
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName:"chevron.backward")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
                .foregroundColor(Color.glDarkGreen)
                .onTapGesture {
                    routemanager.goBack()
                }
            HStack {
                Text(title)
                    .frame(width: 340, alignment: .leadingLastTextBaseline)
                    .fontWeight(.heavy)
                    .font(.system(size: 23))
//                    .padding(.bottom)
            }
            Text(subTitle)
                .frame(width: 340, alignment: .leading)
                .font(.system(size: 16))
                .font(.system(size: 16))
                .padding(.horizontal)
            
            LazyVGrid(columns: columns, spacing: 40) {
                Button(action: {
                    pickAnImage = true
                    backgroundColorForButton3 = .white
                    backgroundColorForButton2 = .white
                    backgroundColorForButton1 = .glgray
                    foregroundColorForButton1 = .white
                    foregroundColorForButton2 = .black
                    foregroundColorForButton3 = .black
                    title = "Pick an Image"
                    subTitle = "Get a card that that looks fun, at just $9.99"
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(backgroundColorForButton1)
                            .shadow(radius: 5)
                        Text("Image Gallery")
                            .frame(width: 100, height: 90)
                            .bold()
                            .foregroundStyle(foregroundColorForButton1)
                            .background(backgroundColorForButton1)
                            .cornerRadius(3)
                    }
                })
                
                Button(action: {
                    routemanager.push(to: .UploadImage)
                    backgroundColorForButton1 = .white
                    backgroundColorForButton3 = .white
                    backgroundColorForButton2 = .glgray
                    foregroundColorForButton1 = .black
                    foregroundColorForButton2 = .white
                    foregroundColorForButton3 = .black
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(backgroundColorForButton2)
                            .shadow(radius: 3)
                        Text("Upload An Image")
                            .frame(width: 100, height: 90)
                            .bold()
                            .foregroundStyle(foregroundColorForButton2)
                            .background(backgroundColorForButton2)
                            .cornerRadius(5)
                    }
                })
                
                Button(action: {
                    pickAnImage = false
                    backgroundColorForButton1 = .white
                    backgroundColorForButton2 = .white
                    backgroundColorForButton3 = .glgray
                    foregroundColorForButton1 = .black
                    foregroundColorForButton2 = .black
                    foregroundColorForButton3 = .white
                    title = "Create a unique card"
                    subTitle = "Get a one-of it's kind metallic Card at $999"
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(backgroundColorForButton3)
                            .shadow(radius: 3)
                        Text("Art and Metal")
                            .frame(width: 100, height: 90)
                            .bold()
                            .foregroundStyle(foregroundColorForButton3)
                            .background(backgroundColorForButton3)
                            .cornerRadius(5)
                    }
                })
                
            }
            .padding()
            
            if(viewModel.isRefreshing){
                Spacer()
                ProgressView()
                Spacer()
            } else {
                VStack {
                    
                    if pickAnImage {
                        List {
                            ForEach(viewModel.imageResponse?.categories.sorted(by: { $0.key < $1.key }) ?? [], id: \.key) { category, imageArray in
                                CustomImageGridWithTitleAPI(Title: "     \(category)", ImageList: imageArray)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                    else {
                        List {
                            ArtAndMetalView(title: "Fussion", artist: "Universal Studio", price: "$100")
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .padding(.top, -18)
            }
            
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(.glgrey2)
        .task {
            await execute()
        }
        .alert(isPresented: $hasError,
               error: error) {
            Button {
                Task {
                    self.hasError = false
                }
            } label: {
                Text("Retry")
            }
            
        }
        
        
    }
}

private extension ContentViewWithAPI {
    func execute() async {
        do {
            try await viewModel.fetchCategories()
        } catch {
            if let userErr = error as? GalleryViewModel.UserError {
                self.error = userErr
                self.hasError = true
            }
        }
    }
}

#Preview {
    ContentViewWithAPI()
        .environmentObject(NavigationRouter())
}

