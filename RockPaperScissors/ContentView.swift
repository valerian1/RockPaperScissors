//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by VLR on 20/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var overallScore = "Player ? : ? Cpu"
    @State private var playerChoice = "Unknown"
    @State private var computerChoice = "Unknown"
    
    var playerScore = 0
    var computerScore = 0
    
    var body: some View {
        VStack {
            Text(overallScore)
                .titleStyle()
            
            Spacer()
            Text(computerChoice)
                .titleStyle()
            Spacer()
            Text(playerChoice)
                .titleStyle()
            Spacer()
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Rock ✊")
                        .threeButtons()
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Paper ✋")
                        .threeButtons()
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Scissors ✌️")
                        .threeButtons()
                })
            }
            Spacer()
        }
    }
}

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
