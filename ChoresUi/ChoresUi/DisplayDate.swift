import SwiftUI

struct DisplayDate: View {
    
    var dateText: String
    
    var body: some View {
        Text(dateText)
            .frame(width: 350, alignment:.bottomLeading)
            .padding()
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .semibold))
    }
}


#Preview {
    DisplayDate(dateText: "Sunday jan 1")
}
