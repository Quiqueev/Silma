//
//  CameraButtonStyle.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 04/06/23.
//

import SwiftUI

struct CameraButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 70, height: 70)
                .background(isEnabled ? Color.white : Color(UIColor.systemGray2))
                .clipShape(Circle())
                .overlay {

                    Circle()
                        .stroke(isEnabled ? Color.white : Color(UIColor.systemGray2), lineWidth: 4)
                        .frame(width: 80, height: 80)
                    if configuration.isPressed {
                        Color(white: 0.0, opacity: 0.2)
                            .clipShape(Circle())
                            .frame(width: 84, height: 84)

                    }
                    
                }
                .padding(10)
    }
}

struct CameraButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {
            
        }
        .buttonStyle(CameraButtonStyle())
        .background(Color.black)
        .disabled(true)
    }
}
