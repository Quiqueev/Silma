//
//  ContentView.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI


struct ContentView: View {
    @State private var isSnapshotReady = false
    @State private var showCharacterSelectionSheet = false
    @State private var currentSceneName = "EmyScene"

    @State private var silmaARView: SilmaARView?
    @State private var capturedImage: UIImage?
    
    var body: some View {
        VStack {
            SilmaARViewRepresentable(currentSceneName: $currentSceneName, silmaARView: $silmaARView)

            
            HStack {
                Spacer()
                    .frame(width: 60)
                Spacer()
                
                Button("") {
                    capturePhoto()
                }
                .buttonStyle(CameraButtonStyle())
                
                
                Spacer()
                
                Button {
                    showCharacterSelectionSheet = true
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
        .background(Color.black)
        .confirmationDialog("Change background", isPresented: $showCharacterSelectionSheet) {
            Button("Emy") { currentSceneName = "EmyScene" }
            Button("Solrac") { currentSceneName = "SolracScene" }
            Button("Lani") { currentSceneName = "LaniScene" }
            Button("Cactus") { currentSceneName = "CactusScene" }
            Button("Cancelar", role: .cancel) { }
        } message: {
            Text("Selecciona una escenea")
        }
        .sheet(isPresented: $isSnapshotReady) {
            ImageView(image: Image(uiImage: capturedImage ?? UIImage()))
        }
        

    }
    
    private func capturePhoto() {
        guard let silmaARView = silmaARView else { return }
        silmaARView.snapshot(saveToHDR: false) { image in
            DispatchQueue.main.async {
                capturedImage = image
                isSnapshotReady = true

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
