//
//  AppAction.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//
import SwiftUI

protocol AppState {}
protocol Action {}

// Observable Store class
@Observable class Store<AppState, Action> {
    // Typealias for the reducer function
    typealias Reduce = (AppState, Action) -> AppState
    
     public var state: AppState
     private let reduce: Reduce
    
    // Initialization with an initial state and a reducer
    init(initialState state: AppState, reduce: @escaping Reduce) {
        self.state = state
        self.reduce = reduce
    }
    
    // Method to send actions to the store
    func send(_ action: Action) {
        // Update the state using the reducer
        state = reduce(state, action)
    }
}


// Define possible actions
enum MainAppAction:Action {
    case increment
    case decrement
    case login
}

// Define a simple state for demonstration purposes
struct MainAppState: AppState {
    var count: Int
    var isLoggedIn: Bool
    var val: String = "Hello"
}

struct LoginState: AppState {
    var username: String
    var password:String
}
enum LoginAction:Action {
    case login
}
// Reducer function
let appReducer: (MainAppState, MainAppAction) -> MainAppState = { state, action in
    var newState = state
    
    switch action {
            case .increment:
                newState.count += 1
            case .decrement:
                newState.count -= 1
            case .login:
                newState.isLoggedIn = true
    }
    
    return newState
}

let loginReducer: (LoginState, LoginAction) -> LoginState = { state, action in
    var newState = state
    
    switch action {
   case .login:
         newState.username = ""
         newState.password = ""
    }
    
    return newState
}


