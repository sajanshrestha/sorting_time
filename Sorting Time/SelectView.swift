//
//  ContentView.swift
//  Sorting Time
//
//  Created by Sajan Shrestha on 11/1/19.
//  Copyright © 2019 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SelectView: View {
    
    var randomlyGenerateArray = [Int]()
    
    @State private var showCompareView = false
    @State private var showAlert = false
    @State private var pickedAlgorithms = [Algorithm]()
    @State private var algorithms = [Algorithm]()
    @State private var numberOfElements = "0"
    
    var body: some View {
        
        
        
        return NavigationView {
            
            VStack {
                List(algorithms) {
                    AlgorithmRow(algorithm: $0)
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Algorithms"))
                
                SelectButton(text: "Compare", action: {
                    
                    var algos = [Algorithm]()
                    for algorithm in self.algorithms {
                        if algorithm.isSelected {
                            algos.append(algorithm)
                        }
                    }

                    if algos.count == 3 {
                        self.pickedAlgorithms = algos
                        self.showCompareView = true
                        print(self.pickedAlgorithms)

                    }
                    else {
                        self.showAlert = true
                        print("Select three algos mane")
                    }
                })
                    .sheet(isPresented: $showCompareView) {
                    CompareView(algorithms: self.pickedAlgorithms)
                    
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Error"), message: Text("Please select three algorithms to compare"), dismissButton: .default(Text("got it!")))
                }
            }
            .onAppear {
                
                print(self.randomlyGenerateArray)
                
                self.algorithms = [
                    Algorithm(name: "Bubble Sort One", duration: AlgorithmBank.BubbleSortOne(array: self.randomlyGenerateArray), description: "", isSelected: false),
                    Algorithm(name: "Bubble Sort Two", duration: AlgorithmBank.BubbleSortTwo(array: self.randomlyGenerateArray), description: "", isSelected: false),
                    Algorithm(name: "Bubble Sort Three", duration: AlgorithmBank.BubbleSortThree(array: self.randomlyGenerateArray), description: "", isSelected: false),
                    Algorithm(name: "Swift Built In Sort", duration: AlgorithmBank.SwiftBuiltInSort(array: self.randomlyGenerateArray), description: "", isSelected: false),
                    Algorithm(name: "Merge Sort", duration: AlgorithmBank.MergeSort(array: self.randomlyGenerateArray), description: "", isSelected: false),
                    Algorithm(name: "Quick Sort", duration: AlgorithmBank.QuickSort(array: self.randomlyGenerateArray), description: "", isSelected: false)
                ]
            }
            
            
        }
    }
    
    
}

struct AlgorithmRow: View {
    
    @ObservedObject var algorithm: Algorithm
    
    var body: some View {
        HStack {
            Text(algorithm.name).font(.custom("Menlo", size: 20.0))
            Spacer()
            
            if algorithm.isSelected {
                Image(systemName: "checkmark.square.fill").font(.title).foregroundColor(.blue).onTapGesture {
                    self.algorithm.isSelected.toggle()
                }
            }
                
            else {
                Image(systemName: "square").font(.title).onTapGesture {
                    self.algorithm.isSelected.toggle()
                }
            }
            
        }
    }
}


