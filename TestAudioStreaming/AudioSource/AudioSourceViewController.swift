//
//  AudioSourceViewController.swift
//  TestAudioStreaming
//
//  Created by Arnav Anshul on 3/4/18.
//  Copyright © 2018 Arnav Anshul. All rights reserved.
//

import UIKit

class AudioSourceViewController: UIViewController {
    
    @IBOutlet weak var audioSourceOptionsTableView: UITableView!
    var audioSourceOptionsDataSource : AudioSourceOptionsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.clear

        self.initializeDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initializeDataSource() {
        guard let pathURLString = Bundle.main.path(forResource: "AudioSourceOptions", ofType: "plist") else { return }
        let sourceOptionsPlistURL = URL(fileURLWithPath: pathURLString)

        self.audioSourceOptionsDataSource = AudioSourceOptionsDataSource(withRootOptionsFileURL: sourceOptionsPlistURL)
        self.audioSourceOptionsTableView.dataSource = audioSourceOptionsDataSource
    }
}

