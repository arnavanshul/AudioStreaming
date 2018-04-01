//
//  MusicListViewController.swift
//  TestAudioStreaming
//
//  Created by Arnav Anshul on 3/31/18.
//  Copyright © 2018 Arnav Anshul. All rights reserved.
//

import Foundation
import UIKit

class MusicListViewController: UIViewController {
    @IBOutlet weak var musicListTableView: UITableView!
    var dataSource: iTunesDataSource = iTunesDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if self.dataSource.checkAuthorizationStatus() != .authorized {
            self.dataSource.requestAuthorization(with: { (authorizationStatus) in
                print(authorizationStatus)
                switch authorizationStatus {
                case .denied, .notDetermined, .restricted:
                    print ("cant do anything")
                    self.dataSource.requestAuthorization(with: { (secondRequestAuthorizationStatus) in
                        print ("requested again")
                    })
                    break
                case .authorized:
                    print("access granted")
                    break
                }
            })
        } else {
            print("do have access")
            self.dataSource.fetchMediaItems()
            self.musicListTableView.dataSource = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MusicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.mediaItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicItem")
        if let mediaItem = self.dataSource.mediaItems?[indexPath.row] {
            cell?.textLabel?.text = mediaItem.albumTitle
        }
        return cell!
    }
}

extension MusicListViewController: UITableViewDelegate {

}
