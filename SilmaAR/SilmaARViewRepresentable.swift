//
//  SilmaARViewRepresentable.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI

/// A `UIViewRepresentable `to use `SilmaARView` in SwiftUI
struct SilmaARViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SilmaARView {
        return SilmaARView()
    }
    
    func updateUIView(_ uiView: SilmaARView, context: Context) {
        
    }
}
