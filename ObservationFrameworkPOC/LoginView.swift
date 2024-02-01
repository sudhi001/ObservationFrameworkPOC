//
//  LoginView.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 01/02/24.
//


import SwiftUI


struct LoginView: View {
    @State var loginStore =  Store<LoginState, LoginAction>(
        initialState: .init(username: "", password: ""),
        reduce: loginReducer
    )
    var body: some View {
        VStack {
             TextField("Username", text:$loginStore.state.username)
             SecureField("Password", text:$loginStore.state.password)
            Button(action: { loginStore.send(.login) }) {
                Text("Log in")
            }
        }
    }
}

#Preview {
    LoginView()
}
