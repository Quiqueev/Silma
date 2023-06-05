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
        VStack {
            SilmaARViewRepresentable(currentSceneName: $currentSceneName)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                    .frame(width: 60)
                Spacer()
                
                Button("") {
                }
                .buttonStyle(CameraButtonStyle())
                
                Spacer()
                
                Button {
                    showingConfirmation = true
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color(white: 1.0, opacity: 0.2))
                        .clipShape(Circle())
                }
            }
            .padding(16)

        }
        .padding(.vertical, 8)
        .background(Color.black)
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
