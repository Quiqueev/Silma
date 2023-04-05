//
//  ContentView.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SilmaARViewRepresentable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
