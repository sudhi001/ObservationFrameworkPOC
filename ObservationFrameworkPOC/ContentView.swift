//
//  ContentView.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//

import SwiftUI



struct ContentView: View {
    @State var appStore = Store<MainAppState, MainAppAction>(
         initialState: .init(count: 0, isLoggedIn: false),
         reduce: appReducer
     )
    var body: some View {
        VStack {
            if !appStore.state.isLoggedIn{
                LoginView()
            }
            CounterView(appStore: $appStore)
        }
    }
    
     
}

#Preview {
    ContentView()
}
