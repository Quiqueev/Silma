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
    @State private var capturedImage: Image?
    
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
            if let validImage = capturedImage {
                ImageView(image: validImage)
            } else {
                Text("Intenta de nuevo.")
            }
        }
        

    }
    
    private func capturePhoto() {
        
        guard let silmaARView = silmaARView else { return }
        
        // Haptic feedback
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        
        silmaARView.snapshot(saveToHDR: false) { image in

            DispatchQueue.main.async {
                if let image = image {
                    capturedImage = Image(uiImage: image)
                    isSnapshotReady = true
                } else {
                    print("Failed to capture image")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
