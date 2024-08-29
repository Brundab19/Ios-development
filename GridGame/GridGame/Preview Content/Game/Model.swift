import Foundation

class Card: Identifiable , ObservableObject{
    
    let id = UUID()
    @Published var isFaceup = false
    @Published var isMatched = false
    var text:String
    
    init(text: String){
        self.text = text
    }
    
    func isOpenedToggle() {
        self.isFaceup.toggle()
    }
}

let imageArray:[String] = ["😃","😎","😇", "🧐"]

func cardList() -> [Card] {
    
    var cardArray = [Card]()
    
    for image in imageArray {
        cardArray.append(Card(text: image))
        cardArray.append(Card(text: image))
    }
    
    return cardArray
}


//class ChoreRepo {
//    subscript(input: String) -> Chore {
//        query = NSFetchResult()
//    }
//}
//
//var choreRepo : ChoreRepo
//
//
//choreRepo[1]


//var cards: [CardData]

/*
 
var engine: GameEngine
 var lastSelected: Card?
 
 Grid cards { card in

   CardUI(card)
    .onTap {
        if engine.verify(lastSelected, card) {
 lastSelected?.change
        }
        lastSelected = card
    }
 
 }
 
 
 */

//
//struct CardData {
//    let emoji: String
//    private(set) var state: CardState
//    
//    mutating func changeState(to state: CardState) {
//        self.state = state
//    }
//}
//
//enum CardState {
//    case closed
//    case open
//    case alwaysOpen
//}



