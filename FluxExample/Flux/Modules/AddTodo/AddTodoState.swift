//
//  AddTodoState.swift
//  FluxExample
//
//  Created by Mikhail Zhdanov on 17/03/2025.
//  Copyright © 2025 EPS. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct AddTodoState: Equatable {

    // Use @BindingState when you need bindings
    
    @BindingState var title = ""
    
}
