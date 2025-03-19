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
    
    var onSave: ((Todo) -> Void)?
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState var isFieldFocused: Bool

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Form {
                TextField("What to do?", text: viewStore.$title)
                    .focused($isFieldFocused)
                Button("Save") {
                    onSave?(Todo(title: viewStore.title))
                    dismiss()
                }
                .disabled(viewStore.title.isEmpty)
            }
            .onAppear {
                isFieldFocused = true
            }
        }
    }

}

#Preview {
    AddTodoView(store: .init(initialState: AddTodoState(), reducer: { AddTodoReducer() }), onSave: nil)
}
