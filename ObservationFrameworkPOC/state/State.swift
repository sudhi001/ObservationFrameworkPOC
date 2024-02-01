//
//  AppAction.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//

protocol State {}
protocol Action {}
// Define possible actions
enum AppAction:Action {
    case increment
    case decrement
    case login
}

// Define a simple state for demonstration purposes
struct AppState: State {
    var count: Int
    var isLoggedIn: Bool
    var val: String = "Hello"
}

struct LoginState: State {
    var username: String
    var password:String
}
enum LoginAction:Action {
    case login
}
// Reducer function
let appReducer: (AppState, AppAction) -> AppState = { state, action in
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


