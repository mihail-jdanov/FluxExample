//
//  TodoListState.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 15/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct TodoListState: Equatable {
    
    // Use @BindingState when you need bindings
        
    var todos: [Todo] = []
    
}
