//
//  iTunesDataSource.swift
//  TestAudioStreaming
//
//  Created by Arnav Anshul on 3/31/18.
//  Copyright © 2018 Arnav Anshul. All rights reserved.
//

import Foundation
import MediaPlayer

class iTunesDataSource: NSObject {
    func checkAuthorizationStatus () -> MPMediaLibraryAuthorizationStatus {
        return MPMediaLibrary.authorizationStatus()
    }

    func requestAuthorization(with completion: (@escaping (MPMediaLibraryAuthorizationStatus) -> Void)) {
        return MPMediaLibrary.requestAuthorization({ (mediaLibraryAuthorizationStatus) in
            completion(mediaLibraryAuthorizationStatus)
        })
    }
}
	
