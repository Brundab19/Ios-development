import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                HStack{
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                    
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                    
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                }
                
                HStack {
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                    
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                    
                    Rectangle()
                        .frame(width: geo.size.width/3 , height: geo.size.height/2)
                        .foregroundColor(.gray)
                        .overlay(){
                            Rectangle()
                                .trim(from:0,to: 0.3)
                        }
                        .overlay(){
                            Rectangle()
                                .stroke(.blue,lineWidth: 4)
                            
                        }
                }
                
            }
        }
    }
}

#Preview {
    GeometryReaderExample()
}
