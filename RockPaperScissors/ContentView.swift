//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by VLR on 20/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var choice = ["Rock ✊", "Paper ✋", "Scissors ✌️"]
    @State private var playerChoice = ""
    @State private var enemyChoice = Int.random(in: 0...2)
    @State private var enemyChose = ""
    @State private var playerScore = 0
    @State private var enemyScore = 0
    @State private var winnerIs = ""
    @State private var restartButton = false
    @State private var shouldHide = false
    
    var body: some View {
        VStack {
            Text("Player \(playerScore) : \(enemyScore) Enemy")
                .titleStyle()
            VStack {
                Spacer()
                Text("\(enemyChose)")
                    .titleStyle()
                
                Spacer()
                Text(winnerIs)
                    .font(.largeTitle).bold()
                // Restart button
                HStack {
                    Button(action: {
                        self.shouldHide = true
                        restartGame()
                    }, label: {
                        Text("Play Again")
                            .threeButtons()
                            .opacity(shouldHide ? 1 : 0)
                    })
                }
                Spacer()
                
                Text("\(playerChoice)")
                    .titleStyle()
                Spacer()
            }
            
            
            HStack {
                // Play buttons
                Button(action: {
                    self.shouldHide = false
                    buttonTapped(0)
                }, label: {
                    Text(choice[0])
                        .threeButtons()
                        .opacity(shouldHide ? 0 : 1)
                })
                
                Button(action: {
                    self.shouldHide = false
                    buttonTapped(1)
                }, label: {
                    Text(choice[1])
                        .threeButtons()
                        .opacity(shouldHide ? 0 : 1)
                })
                
                Button(action: {
                    self.shouldHide = false
                    buttonTapped(2)
                }, label: {
                    Text(choice[2])
                        .threeButtons()
                        .opacity(shouldHide ? 0 : 1)
                })
            }
            Spacer()
        }
    }
    
    // Game functions
    func buttonTapped(_ number: Int) {
        if number == 0 {
            playerChoice = choice[0]
            
            if enemyChoice == 0 {

            } else if enemyChoice == 1 {
                enemyScore += 1
            } else if enemyChoice == 2 {
                playerScore += 1
            }
             
        } else if number == 1 {
            playerChoice = choice[1]
            
            if enemyChoice == 0 {
                playerScore += 1

            } else if enemyChoice == 1 {
                
            } else if enemyChoice == 2 {
                enemyScore += 1

            }
            
        } else if number == 2 {
            playerChoice = choice[2]
            
            if enemyChoice == 0 {
                enemyScore += 1
            } else if enemyChoice == 1 {
                playerScore += 1
            } else if enemyChoice == 2 {
                
            }
        }
        computerChoose()
        checkWinner()
    }
    
    func computerChoose() {
        enemyChose = choice[enemyChoice]
        enemyChoice = Int.random(in: 0...2)
    }
    
    func checkWinner() {
        if playerScore == 10 {
            winnerIs = "YOU WIN"
            shouldHide = true
            if playerScore >= 11 {
                restartGame()
            }
        } else if enemyScore == 10 {
            winnerIs = "YOU LOOSE"
            shouldHide = true
            if enemyScore >= 11 {
                restartGame()
            }
        }
    }
    
    func restartGame() {
        playerScore = 0
        enemyScore = 0
        winnerIs = ""
        shouldHide = false
    }
}


// View modifiers
struct ButtonStyle: ViewModifier {
    @State var buttonColor = Color.blue
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 18))
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

extension View {
    func threeButtons() -> some View {
        modifier(ButtonStyle(buttonColor: .black))
    }
}

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
