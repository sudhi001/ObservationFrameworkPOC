//
//  CounterView.swift
//  ObservationFrameworkPOC
//
//  Created by Sudhi on 30/01/24.
//

import SwiftUI

struct CounterView : View {
    @Environment(\.appStore) var appStore
    
    var body: some View {
        VStack {
            Text("Current Count: \(appStore.state.count)")
                .padding()
            
            HStack {
                Button("Increment") {
                    appStore.send(.increment)
                }
                .padding()
                
                Button("Decrement") {
                    appStore.send(.decrement)
                }
                .padding()
            }
        }
        .onAppear {
            // Optional: Perform any setup or initialization when the view appears
        }
    }
}

