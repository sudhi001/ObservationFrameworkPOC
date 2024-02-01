//
//  AppState.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//

import SwiftUI


// Observable Store class
@Observable class Store<State, Action> {
    // Typealias for the reducer function
    typealias Reduce = (State, Action) -> State
    
     private(set) var state: State
     private let reduce: Reduce
    
    // Initialization with an initial state and a reducer
    init(initialState state: State, reduce: @escaping Reduce) {
        self.state = state
        self.reduce = reduce
    }
    
    // Method to send actions to the store
    func send(_ action: Action) {
        // Update the state using the reducer
        state = reduce(state, action)
    }
}

struct StoreKey: EnvironmentKey {
    static var defaultValue = Store<AppState, AppAction>(
        initialState: .init(count: 0, isLoggedIn: false),
        reduce: appReducer
    )
}
struct LoginStoreKey: EnvironmentKey {
    static var defaultValue = Store<LoginState, LoginAction>(
        initialState: .init(username: "", password: ""),
        reduce: loginReducer
    )
}

extension EnvironmentValues {
    var appStore: Store<AppState, AppAction> {
        get { self[StoreKey.self] }
        set { self[StoreKey.self] = newValue }
    }
    var loginStore: Store<LoginState, LoginAction> {
        get { self[LoginStoreKey.self] }
        set { self[LoginStoreKey.self] = newValue }
    }
}
