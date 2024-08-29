import SwiftUI

struct FlipUsingState: View {
    
    @ObservedObject var flipModel = ProtocolModel()
    
    var body: some View {
        
        Grid {
            GridRow {
                ForEach (0..<3) { _ in
                    Rectangle()
                        .foregroundColor(flipModel.isfliped ? .blue : .green)
                        .frame(width:100 , height:100)
                }
                        .onTapGesture {
                            flipModel.toggle()
                        }
                        .rotation3DEffect(.degrees(flipModel.isfliped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: flipModel.isfliped)
                
            }
            GridRow {
                ForEach (0..<3) { _ in
                    Rectangle()
                        .foregroundColor(flipModel.isfliped ? .blue : .green)
                        .frame(width:100 , height:100)
                }
                        .onTapGesture {
                            flipModel.toggle()
                        }
                        .rotation3DEffect(.degrees(flipModel.isfliped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: flipModel.isfliped)
                
            }
            
            GridRow {
                ForEach (0..<3) { _ in
                    Rectangle()
                        .foregroundColor(flipModel.isfliped ? .blue : .green)
                        .frame(width:100 , height:100)
                }
                        .onTapGesture {
                            flipModel.toggle()
                        }
                        .rotation3DEffect(.degrees(flipModel.isfliped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: flipModel.isfliped)
                
            }
        }
    }
}

#Preview {
    FlipUsingState()
}
