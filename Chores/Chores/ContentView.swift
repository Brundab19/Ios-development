import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
       Header()
            
        List {
            Section{
                ShowChoreDetail(choreTitle: "🧹 Clean the house", choreRecurring: "Complete this task daily")
                ShowChoreDetail(choreTitle: "🧹 Clean the room", choreRecurring: "Complete this task daily")
            }header: {
                DisplayDate(dateText: "Sunday jan 1")
            }
            
            
            Section{
                ShowChoreDetail(choreTitle: " 🧽 Clean the house", choreRecurring: "Complete this task weekly")
            }header: {
                DisplayDate(dateText: "Monday jan 2")
            }
            
            Section{
                ShowChoreDetail(choreTitle: "🧽 Clean the house",choreRecurring: "Complete this task montly")
            }header: {
                DisplayDate(dateText: "Tuesday jan 3")
            }
        }
        
        Spacer()
            
        AddChoreButton()
    
    }

}
    
#Preview {
    ContentView()
}

