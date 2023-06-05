//
//  SilmaARViewRepresentable.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI

/// A `UIViewRepresentable `to use `SilmaARView` in SwiftUI
struct SilmaARViewRepresentable: UIViewRepresentable {
    
    @Binding var currentSceneName: String
    @Binding var silmaARView: SilmaARView?
    
    func makeUIView(context: Context) -> SilmaARView {
        let arView = SilmaARView()
        DispatchQueue.main.async {
            self.silmaARView = arView
        }
        return arView
    }
    
    func updateUIView(_ silmaARView: SilmaARView, context: Context) {
        silmaARView.showScene(sceneName: currentSceneName)
    }
}
