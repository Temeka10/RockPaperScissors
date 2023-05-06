//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mac on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var   scoreTitle = ""
    @State private var endOfTheGame = false
    @State private var showingScore = false
    @State private var score = 0
    @State private var finalGoal = 0
    let possibleMoves = ["✋", "✊", "✌️"]
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    var body: some View {
        ZStack {
            createBackGroundView()
            VStack(spacing: 30) {
                Spacer()
                Text("RPS")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                        Text("Computer plays")
                            .foregroundStyle(.black)
                            .font(.headline.weight(.semibold))
                            .padding()
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                       Text(possibleMoves[randomMove])
                            .padding()
                            .background(.black)
                            .clipShape(Capsule())
                    if shouldWin == true {
                        Text("You must win")
                            .padding()
                            .foregroundStyle(.black)
                            .font(.headline.weight(.semibold))
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                        Text("You must lose")
                            .padding()
                            .foregroundStyle(.black)
                            .font(.headline.weight(.semibold))
                            .background(.red
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                        Text("Your play")
                        .foregroundStyle(.black)
                        .font(.headline.weight(.semibold))
                        .padding()
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    HStack {
                        ForEach(0..<3) { number in
                            Button {
                                buttonTapped(number)
                                finalGoal += 1
                            } label: {
                                Text(possibleMoves[number])
                                    .padding()
                                    .background(.black)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .alert( isPresented: $showingScore) {
                    Alert(
                        title: Text(scoreTitle),
                primaryButton: .default(
                    Text("Continue"),
                                    action: game
                ),
                        secondaryButton: .destructive(
                            Text("Restart"),
                            action: resetTheGame
                        )
                )
                }
                .alert("End of the game", isPresented: $endOfTheGame) {
                    Button("Restart the game", action: resetTheGame)
                } message: {
                    Text("Your final score is \(score)")
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .padding(.horizontal, 100)
                    .padding()
                    .font(.headline.monospaced())
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
        }
    }
    func buttonTapped(_ number: Int){
        if possibleMoves[randomMove] ==  possibleMoves[number]  {
            score += 0
            scoreTitle = "Draw"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✋" && shouldWin == true && possibleMoves[number] == "✌️"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✋" && shouldWin == true && possibleMoves[number] == "✊" {
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✋" && shouldWin == false && possibleMoves[number] == "✊"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✋" && shouldWin == false && possibleMoves[number] == "✌️" {
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✊" && shouldWin == true && possibleMoves[number] == "✋"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✊" && shouldWin == true && possibleMoves[number] == "✌️" {
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✊" && shouldWin == false && possibleMoves[number] == "✌️"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✊" && shouldWin == false && possibleMoves[number] == "✋" {
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✌️" && shouldWin == true && possibleMoves[number] == "✊"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✌️" && shouldWin == true && possibleMoves[number] == "✋"  {
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        if possibleMoves[randomMove] == "✌️" && shouldWin == false && possibleMoves[number] == "✋"{
            score += 1
            scoreTitle = "Correct"
            showingScore = true
        } else if possibleMoves[randomMove] == "✌️" && shouldWin == false && possibleMoves[number] == "✊"{
            score -= 1
            scoreTitle = "Incorrect"
            showingScore = true
        }
        }
    func resetTheGame(){
        finalGoal = 0
        score = 0
        randomMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    func game (){
        if finalGoal == 10 {
            endOfTheGame = true
        }
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    }
    private func createBackGroundView() -> some View {
        AngularGradient(colors: [.black, .white, .black , .white], center: .bottomTrailing)
            .ignoresSafeArea()
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
