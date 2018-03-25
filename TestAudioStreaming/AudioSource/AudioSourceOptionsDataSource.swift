//
//  AudioSourceOptionsDataSource.swift
//  TestAudioStreaming
//
//  Created by Arnav Anshul on 3/24/18.
//  Copyright © 2018 Arnav Anshul. All rights reserved.
//

import Foundation
import UIKit

class AudioSourceOptionsDataSource: NSObject, UITableViewDataSource {
    var sourceOptionsList : [String]

    init?(withRootOptionsFileURL rootOptionsFilePathURL:URL?) {
        guard let rootOptionsFileURL = rootOptionsFilePathURL,
            let sourceOptionsList = NSArray(contentsOf: rootOptionsFileURL) as? [String] else {
            return nil
        }
        self.sourceOptionsList = sourceOptionsList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceOptionsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioSourceOption")
        cell?.textLabel?.text = self.sourceOptionsList[indexPath.row]
        return cell!
    }
}
