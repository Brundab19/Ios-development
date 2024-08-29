import SwiftUI

struct ContentView: View {
    @State var cnt : Int = 0
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
                .ignoresSafeArea()
            VStack {
                Image(systemName: cnt >= 5 ? "globe" : "square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .onTapGesture {
                        cnt += 1
                    }
                
                Text("The Number of taps are \(cnt)")
                
                Text("The total cost of the globe is \(cnt * 10)")
                //Spacer()
            }
            TabView {
               view1()
            }
        }
    }
}

#Preview {
    ContentView()
}
