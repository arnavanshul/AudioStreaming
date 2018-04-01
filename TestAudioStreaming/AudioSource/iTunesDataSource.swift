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
    var mediaItems: [MPMediaItem]? = nil

    func checkAuthorizationStatus () -> MPMediaLibraryAuthorizationStatus {
        return MPMediaLibrary.authorizationStatus()
    }

    func requestAuthorization(with completion: (@escaping (MPMediaLibraryAuthorizationStatus) -> Void)) {
        return MPMediaLibrary.requestAuthorization({ (mediaLibraryAuthorizationStatus) in
            if mediaLibraryAuthorizationStatus == .authorized {
                self.fetchMediaItems()
            }
            completion(mediaLibraryAuthorizationStatus)
        })
    }

    var mediaLibrary: MPMediaLibrary {
        get {
            return MPMediaLibrary.default()
        }
    }

    func fetchMediaItems() {
        self.mediaItems = MPMediaQuery.songs().items
    }
}
	
