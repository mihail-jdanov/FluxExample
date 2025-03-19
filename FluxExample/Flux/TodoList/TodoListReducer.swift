//
//  TodoListReducer.swift
//  FluxExample
//
//  Created by Михаил Жданов on 17.03.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TodoListReducer {
    
    typealias State = TodoListState
    typealias Action = TodoListAction
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .addTodo(let todo):
                state.todos.append(todo)
                return .none
            case .toggleCompletion(let id):
                if let index = state.todos.firstIndex(where: { $0.id == id }) {
                    state.todos[index].isCompleted.toggle()
                }
                return .none
            }
        }
    }
    
}
