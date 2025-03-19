//
//  Dispatcher.swift
//  FluxExample
//
//  Created by Михаил Жданов on 19.03.2025.
//

import Foundation
import ComposableArchitecture

final class Dispatcher {
    
    static let shared = Dispatcher()
    
    private var stores: [AnyStore] = []
    
    func register<T: Reducer>(_ store: StoreOf<T>, reducerType: T.Type) {
        let anyStore = AnyStore(store: store, reducerType: reducerType)
        guard !stores.contains(anyStore) else { return }
        stores.append(anyStore)
        removeDeadStores()
    }
    
    func dispatch<Action>(_ action: Action) {
        for store in stores {
            store.send(action)
        }
        removeDeadStores()
    }
    
    private func removeDeadStores() {
        stores.removeAll { $0.obj == nil }
    }
    
}
