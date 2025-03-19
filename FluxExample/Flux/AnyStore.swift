//
//  AnyStore.swift
//  FluxExample
//
//  Created by Михаил Жданов on 19.03.2025.
//

import Foundation
import ComposableArchitecture

class AnyStore {
    
    private(set) weak var obj: AnyObject?
    
    private let _send: (Any) -> Void
    
    init<T: Reducer>(store: StoreOf<T>, reducerType: T.Type) {
        obj = store
        self._send = { [weak store] action in
            if let action = action as? T.Action {
                store?.send(action)
            }
        }
    }
    
    func send(_ action: Any) {
        _send(action)
    }
    
}

extension AnyStore: Equatable {
    
    static func == (lhs: AnyStore, rhs: AnyStore) -> Bool {
        return lhs.obj === rhs.obj
    }
    
}
