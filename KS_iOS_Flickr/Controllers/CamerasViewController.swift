//
//  CamerasViewController.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 20.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import UIKit

class CamerasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CameraInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoTableViewCell")
        tableView.register(UINib(nibName: "CameraInfoWithDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoWithDetailsTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraInfoTableViewCell", for: indexPath)
        
        return cell
    }

}
