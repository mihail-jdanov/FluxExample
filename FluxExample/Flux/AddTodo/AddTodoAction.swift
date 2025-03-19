//
//  AddTodoAction.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 17/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import Foundation
import ComposableArchitecture

enum AddTodoAction: BindableAction {
    
    typealias State = AddTodoState
    
    case binding(BindingAction<State>)
    case textChanged(String)

}
