//
//  ContentView.swift
//  Useless Converter
//
//  Created by Edgar Jaime on 6/27/23.
//

// have it connect to another view where you can add shit to the list
// another view with other conversion options

import SwiftUI

struct ContentView: View {
    // have a random num be choosen which refers to things list and alos another list with it's values
    @FocusState private var isFocused: Bool
    @State private var input : Int = 0
    let lengths =  ["Centimeters" ,"Inches" ,"Meters", "Feet", "Yards", "Miles"]
    @State private var choosenUnit : String = "Centimeters"
    @State private var randomChoice = Int.random(in: 0...8)
    let things =  ["Ant" ,"Logitech K380 Keybaord" ,"Tesla Model 3", "iPhone 14 Pro Max", "Japanese shaku", "Rubber Duck", "Hotdog", "Banana Peel","Barbie Doll"]
    
    var output : String { // add radomize button, close keybaord
        var bruh : String = ""
        var number : Double = 0
        var baseLength : Double = 0 //centimeters
        if (choosenUnit == "Centimeters"){ //input
            baseLength = Double(input)
        }
        else if (choosenUnit == "Inches"){ //input
            baseLength = Double(input)*2.54
        }
        else if (choosenUnit == "Meters"){ //input
            baseLength = Double(input)*100
        }
        else if (choosenUnit == "Feet"){
            baseLength = Double(input)*30.48
        }
        else if (choosenUnit == "Yards"){
            baseLength = Double(input)*91.48
        }
        else if (choosenUnit == "Miles"){
            baseLength = Double(input)*160934.4
        }
        
        var outputUnit = things[randomChoice]

        if (outputUnit == "Ant"){ //output
            number = baseLength/0.5
        }
        else if (outputUnit == "Logitech K380 Keybaord"){
            number = baseLength/28
        }
        else if (outputUnit == "Tesla Model 3"){
            number = baseLength/469
        }
        else if (outputUnit == "iPhone 14 Pro Max"){
            number = baseLength/16
        }
        else if (outputUnit == "Japanese shaku"){
            number = baseLength/30.3
        }
        else if (outputUnit == "Rubber Duck"){
            number = baseLength/10
        }
        else if (outputUnit == "Hotdog"){
            number = baseLength/15
        }
        else if (outputUnit == "Banana Peel"){
            number = baseLength/20
        }
        else if (outputUnit == "Barbie Doll"){
            number = baseLength/29
        }
        
        var formatted = String(format: "%.3f", number) //simplifies the double
        
        if number >= 1.000000000001{ //adds s' depending if it's greater then 1
            bruh = ("\(formatted) \(things[randomChoice])s'")
        }
        else {
            bruh = ("\(formatted) \(things[randomChoice])")
        }
        
        return bruh
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.secondary,.teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Very useful conversion app")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                VStack{
                    Text("Enter your conversion")
                        .bold()
                    // shows the selected choice, stack them up
                    
                    TextField("Amount", value: $input, format: .number)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(.thinMaterial)
                        .focused($isFocused)

//                    Picker("input unit", selection: $choosenUnit) {
//                        ForEach(lengths, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                    .pickerStyle(.segmented)
                    Text("\(choosenUnit)")
                        .padding(8)
                        .foregroundColor(.black)
                        .background(.teal)// box background
                    HStack{
                        Spacer()

                        Button("Centimeters") { //make it chnage color depending on it's state and have it be a certain width
                            choosenUnit = "Centimeters"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Centimeters" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()
                        Button("Inches") {
                            choosenUnit = "Inches"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Inches" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()

                        Button("Meters") {
                            choosenUnit = "Meters"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Meters" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()

                    }
                    
                    HStack{
                        Spacer()
                        Button("Feet") {
                            choosenUnit = "Feet"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Feet" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()
                        Button("Yards") {
                            choosenUnit = "Yards"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Yards" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()
                        Button("Miles") {
                            choosenUnit = "Miles"
                        }
                        .padding()//makes it nice
                        .foregroundColor(choosenUnit == "Miles" ? .blue : .black)// text color
                        .background(.thinMaterial)// box background
                        .cornerRadius(40)
                        Spacer()
                    }
                    
                    
                    
                }
                .frame(maxWidth: 400) //limits the stack to this current shape
                .padding(.vertical, 15)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack{
                    Text("\(output)")
                        .padding()
                    Button("Randomize!") {
                        randomize()
                    }
                    .padding()
                    .background(.thinMaterial)// box background
                    .cornerRadius(40)
                }
                .frame(maxWidth: 400) //limits the stack to this current shape
                .padding(.vertical, 15)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()

            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }

        }
        
    }
    
    func randomize() { //seperate from scoreTitle for cleaner look / being simpler
        randomChoice = Int.random(in: 0...7)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
