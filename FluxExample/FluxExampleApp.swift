//
//  FluxExampleApp.swift
//  FluxExample
//
//  Created by Михаил Жданов on 12.03.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct FluxExampleApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView(store: Store(initialState: TodoListState(), reducer: { TodoListReducer() }))
            }
        }
    }
    
}
