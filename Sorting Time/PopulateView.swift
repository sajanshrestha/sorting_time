//
//  PopulateView.swift
//  Sorting Time
//
//  Created by Sajan Shrestha on 11/2/19.
//  Copyright © 2019 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PopulateView: View {
    
    @State private var numberOfElements = ""
    @State private var showListView = false
    @State private var showAlert = false
    @State private var randomlyGeneratedArray = [Int]()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Please enter the size of your array. Your array items will be randomly generated.").font(Font.custom("Menlo", size: 20)).padding()
                TextField("number of elements", text: $numberOfElements).padding(.leading).padding(.trailing).textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                SelectButton(text: "Go", action: {
                    if let generatedArray = self.generateRandomElements() {
                        self.randomlyGeneratedArray = generatedArray
                        self.showListView = true
                    }
                    else {
                        self.showAlert = true
                    }
                })
                .sheet(isPresented: $showListView) {
                    SelectView(randomlyGenerateArray: self.randomlyGeneratedArray)
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Error"), message: Text("Please enter a valid number not greater than 1000"), dismissButton: .default(Text("got it!")))
                }
            }
            .navigationBarTitle(Text("Running Time"))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.init(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, opacity: 0.7504013271 ))
            
        }
    }

    func generateRandomElements() -> [Int]? {
        
        guard let enteredNumber = Int(numberOfElements) else {return nil}
        
        guard enteredNumber > 0  && enteredNumber < 1001 else {return nil}
        
        var myArray = [Int]()
        
        for _ in 1...enteredNumber {
            let randomNumber = Int.random(in: 1 ... 1000)
            myArray.append(randomNumber)
        }
        
        return myArray
    }
    
}

struct SelectButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: {
            self.action()
        }) {
            ZStack {
                Rectangle().frame(width: UIScreen.main.bounds.width - 30, height: 35, alignment: .center).background(Color.green).cornerRadius(10)
                Text(text).foregroundColor(Color.white)
            }
        }
    }
}
