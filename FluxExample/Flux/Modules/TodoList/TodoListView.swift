//
//  TodoListView.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 15/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct TodoListView: View {

    @Bindable var store: StoreOf<TodoListReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List {
                ForEach(viewStore.todos) { todo in
                    HStack {
                        Text(todo.title)
                        Spacer()
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                viewStore.send(.toggleCompletion(todo.id))
                            }
                    }
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                NavigationLink("➕") {
                    AddTodoView(store: Store(initialState: AddTodoState(), reducer: { AddTodoReducer() }))
                }
            }
        }
        .onAppear {
            Dispatcher.shared.register(store, reducerType: TodoListReducer.self)
        }
    }
    
}

#Preview {
    TodoListView(store: .init(initialState: TodoListState(), reducer: { TodoListReducer() }))
}
