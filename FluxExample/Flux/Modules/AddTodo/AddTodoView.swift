//
//  AddTodoView.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 17/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct AddTodoView: View {

    let store: StoreOf<AddTodoReducer>
        
    @Environment(\.dismiss) var dismiss
    
    @FocusState var isFieldFocused: Bool

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Form {
                TextField("What to do?", text: viewStore.$title)
                    .focused($isFieldFocused)
                Button("Save") {
                    dismiss()
                    Dispatcher.shared.dispatch(TodoListAction.addTodo(viewStore.title))
                }
                .disabled(viewStore.title.isEmpty)
            }
            .onAppear {
                isFieldFocused = true
            }
        }
        .onAppear {
            Dispatcher.shared.register(store, reducerType: AddTodoReducer.self)
        }
    }

}

#Preview {
    AddTodoView(store: .init(initialState: AddTodoState(), reducer: { AddTodoReducer() }))
}
