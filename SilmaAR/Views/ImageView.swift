//
//  ImageView.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 04/06/23.
//

import SwiftUI

struct ImageView: View {
    var image: Image
    @State private var showShareSheet = false
    
    @Environment(\.dismiss) var dismiss
    

    var body: some View {
        NavigationView {
            VStack {
                
                ShareLink(
                    item: image,
                    message: Text("Conoce más en https://www.silmaed.com/"),
                    preview: SharePreview("Foto con Grupo Silma", image: image)) 
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()

            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Compartir foto")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {

                }
            }

        }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image(systemName: "person.fill"))
    }
}
