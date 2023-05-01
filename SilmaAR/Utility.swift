//
//  Utility.swift
//  SilmaAR
//
//  Created by Ricardo Montemayor on 01/05/23.
//

import Foundation
import RealityKit

class Utility {
    
    static func createRealityURL(filename: String, fileExtension: String, sceneName: String) -> URL? {
        // Create a URL that points to the specified Reality file.
        guard let realityFileURL = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("Error finding Reality file \(filename).\(fileExtension)")
            return nil
        }

        // Append the scene name to the URL to point to
        // a single scene within the file.
        let realityFileSceneURL = realityFileURL.appendingPathComponent(sceneName, isDirectory: false)
        return realityFileSceneURL
    }
    
    static func loadRealityComposerScene (filename: String, fileExtension: String, sceneName: String) -> (Entity & HasAnchoring)? {
        guard let realitySceneURL = Utility.createRealityURL(filename: filename, fileExtension: fileExtension, sceneName: sceneName) else {
            return nil
        }
        let loadedAnchor = try? Entity.loadAnchor(contentsOf: realitySceneURL)

        return loadedAnchor
    }
    
}
