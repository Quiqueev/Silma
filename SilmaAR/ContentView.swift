//
//  ContentView.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var currentSceneName = "EmyScene"

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            SilmaARViewRepresentable(currentSceneName: $currentSceneName)
                .ignoresSafeArea()
            Button {
                showingConfirmation = true
            } label: {
                Image(systemName: "trapezoid.and.line.horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(16)
                    .background(.blue)
                    .clipShape(Circle())
            }
            .padding(16)
        }
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Emy") { currentSceneName = "EmyScene" }
            Button("Solrac") { currentSceneName = "SolracScene" }
            Button("Lani") { currentSceneName = "LaniScene" }
            Button("Cactus") { currentSceneName = "CactusScene" }
            Button("Cancelar", role: .cancel) { }
        } message: {
            Text("Selecciona una escenea")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
