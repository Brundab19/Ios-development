import SwiftUI

struct SimpleImage: View {
    @State private var isflip: Bool = false
    var body: some View {
        
//        Button {
//            withAnimation {
//                flip.toggle()
//            }
//        }label: {
//            Image(.mapkit)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width:200)
//                .rotation3DEffect(.degrees(flip ? 180 : 0),axis: (x: 0, y: 1, z: 0))
//
//        }
        ZStack {
            Image(.mapkit)
                .frame(width: 200,height: 200)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .rotation3DEffect(.degrees(isflip ? 0 : -90), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                ).animation(isflip ? .linear.delay(0.35) : .linear, value: isflip)
            
            Image(systemName: "globe")
                .frame(width:200, height: 200)
                .foregroundColor(.red)
                .rotation3DEffect(.degrees(isflip ? 90 : 0), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                ).animation(isflip ? .linear : .linear.delay(0.35), value: isflip)
                
        }.onTapGesture {
            withAnimation (.easeIn){
                isflip.toggle()
            }
        }
            
            
    }
}

#Preview {
    SimpleImage()
}
