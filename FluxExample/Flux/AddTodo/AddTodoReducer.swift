//
//  AddTodoReducer.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 17/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddTodoReducer {

    typealias State = AddTodoState
    typealias Action = AddTodoAction
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .textChanged(let text):
                guard text != state.title else { return .none }
                state.title = text
                return .none
            }
        }
    }

}


