//
//  ContentView.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.appStore) var appStore
    @Environment(\.loginStore) var loginStore
    
    var body: some View {
        VStack {
            CounterView()
        }
    }
    
     
}
struct LoginView: View {
    @Environment(\.loginStore) var loginStore
    var body: some View {
        VStack {
           // TextField("Username", text:$loginStore.state.username)
           // SecureField("Password", text:$oginStore.state.password)
            Button(action: { loginStore.send(.login) }) {
                Text("Log in")
            }
        }
    }
}
#Preview {
    ContentView()
}
