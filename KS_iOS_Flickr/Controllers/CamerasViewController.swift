//
//  CamerasViewController.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 20.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import UIKit
import Alamofire

class CamerasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cameras : [Camera] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CameraInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoTableViewCell")
        tableView.register(UINib(nibName: "CameraInfoWithDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoWithDetailsTableViewCell")
        
        let brand = "Canon"
        let api_key = "d83eecafd1434a621a66256ae80f4dbe"
        let parameters = "api_key=\(api_key)&brand=\(brand)&format=json&nojsoncallback=1"
        let url = "https://api.flickr.com/services/rest/?method="
        let method = "flickr.cameras.getBrandModels"
        let urlRequest = "\(url)\(method)&\(parameters)"
        
        Alamofire.request(urlRequest, method: .get, parameters: nil, encoding:
            JSONEncoding.default, headers: nil).responseJSON {response in
            print("URLRESPONSE")
            print(response)
            do {
                let decoder = JSONDecoder()
                let data1 = try decoder.decode(CameraResponse.self, from: response.data!)
                print(data1.cameras.camera.count)
                self.cameras = data1.cameras.camera
                self.tableView.reloadData()
                
            } catch {print(error)}
                
            
            
        }
        print("METHOD COMPLETED")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row % 2 == 0 {
//
//            let detailCell = tableView.dequeueReusableCell(withIdentifier: "CameraInfoWithDetailsTableViewCell", for: indexPath) as! CameraInfoWithDetailsTableViewCell
//
//            return detailCell
//    }
//
       
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "CameraInfoTableViewCell", for: indexPath) as! CameraInfoTableViewCell
        let camera = cameras[indexPath.row]
        cell.setData(camera: camera)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return indexPath.row % 2 == 0 ? 100 : 44
        return 44
    }
    

    
}
