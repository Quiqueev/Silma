//
//  ARView.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 27/03/23.
//

import SwiftUI
import ARKit
import RealityKit

/// Custom ARView to display AR content
class SilmaARView: ARView {
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        showScene(sceneName: "EmyScene")
    }


    func showScene(sceneName: String) {
        scene.anchors.removeAll()
        guard let entity = Utility.loadRealityComposerScene(filename: "SilmaScenes", fileExtension: "reality", sceneName: sceneName) else { return }
        #if targetEnvironment(simulator)
        let anchor = AnchorEntity(world: [0,0,0])
        #else
        let anchor = AnchorEntity(plane: .horizontal)
        #endif
        anchor.addChild(entity)
        scene.addAnchor(anchor)
    }
    

}

struct Previews_SilmaARView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
