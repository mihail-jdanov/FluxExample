//
//  Todo.swift
//  FluxExample
//
//  Created by Михаил Жданов on 15.03.2025.
//

import Foundation

struct Todo: Identifiable, Equatable {
    
    let id = UUID()
    
    var title: String
    var isCompleted: Bool = false
    
}
