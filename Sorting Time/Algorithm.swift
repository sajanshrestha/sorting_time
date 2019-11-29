//
//  Algorithm.swift
//  Sorting Time
//
//  Created by Sajan Shrestha on 11/29/19.
//  Copyright © 2019 Sajan Shrestha. All rights reserved.
//

import Foundation

class Algorithm: Identifiable, ObservableObject {
    
    var id = UUID()
    var name: String
    var duration: Double
    var description: String
    @Published var isSelected: Bool
    
    init(name: String, duration: Double, description: String, isSelected: Bool) {
        self.name = name
        self.duration = duration
        self.description = description
        self.isSelected = isSelected
    }
}
