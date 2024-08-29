import SwiftUI

struct ContentView: View {
    
    @State var cards = cardList().shuffled()
    @State var matchingCards = [Card]()
    @State var UserChoices = [Card]()
    @State var Score:Int = 0
    @State var cnt:Int = 0
    
    let threeColumns = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            
            LazyVGrid(columns: threeColumns, spacing:10) {
                ForEach(cards) {card in
                    CardView(cardView: card, matchingCards: $matchingCards, UserChoices: $UserChoices, Score: $Score)
                }
            }
            
            VStack {
                Text("Match these cards to win")
                LazyVGrid(columns: threeColumns, spacing: 10) {
                    
                    ForEach(imageArray, id:\.self) { cardValue in
                        if !matchingCards.contains(where: {$0.text == cardValue}) {
                            Text(cardValue)
                                .font(.system(size: 40))
                        }
                    }
                }
            }
            Text("Score: \(Score)")
        }
    }
}

#Preview {
    ContentView()
}
