//
//  TodoListAction.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 15/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import Foundation
import ComposableArchitecture

enum TodoListAction: BindableAction {
    
    typealias State = TodoListState

    case binding(BindingAction<State>)
    case addTodo(String)
    case toggleCompletion(UUID)
    
}
