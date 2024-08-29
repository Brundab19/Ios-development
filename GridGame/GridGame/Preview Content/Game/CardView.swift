import SwiftUI

class GameEngine {
    
}

struct CardView: View {
    
    @ObservedObject var cardView:Card
    @Binding var matchingCards:[Card]
    @Binding var UserChoices:[Card]
    @Binding var Score:Int
    
    var body: some View {
    
        if cardView.isFaceup || matchingCards.contains(where: {$0.id == cardView.id}){
                Text(cardView.text)
                    .font(.system(size: 50))
                    .frame(width:90 , height: 90)
                    .background(Color.blue)
                    .padding()
                    .onTapGesture {
                        cardView.isOpenedToggle()
                    }
            }else {
                Text("?")
                    .font(.system(size: 50))
                    .frame(width:90 , height: 90)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .padding()
                
                    .onTapGesture {
                        if UserChoices.count == 0 {
                            cardView.isOpenedToggle()
                            UserChoices.append(cardView)
                            print(UserChoices.count)
                        }else if UserChoices.count == 1 {
                            cardView.isOpenedToggle()
                            UserChoices.append(cardView)
                            withAnimation(Animation.linear.delay(1)){
                                for thisCard in UserChoices {
                                    thisCard.isOpenedToggle()
                                }
                            }
                            checkForMatch()
                        }
                        
                    }
            }
    }
    
    func checkForMatch() {
        if UserChoices[0].text == UserChoices[1].text {
            matchingCards.append(UserChoices[0])
            matchingCards.append(UserChoices[1])
            Score += 1
        }
        UserChoices.removeAll()
        
        
        if Score == 3 {
            print("win")
        }
    }
}

