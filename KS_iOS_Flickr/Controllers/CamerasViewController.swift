//
//  CamerasViewController.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 20.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import UIKit
import Alamofire

class CamerasViewController: UIViewController,
                            UITableViewDataSource,
                            UITableViewDelegate,
                            UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var cameras : [Camera] = []
    var request: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        tableView.register(UINib(nibName: "CameraInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoTableViewCell")
        tableView.register(UINib(nibName: "CameraInfoWithDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraInfoWithDetailsTableViewCell")
        tableView.isHidden = true
        //loadCamerasFromServer(brand: "Canon")
    }
    
    func loadCamerasFromServer(brand: String) {
        
        let api_key = "d83eecafd1434a621a66256ae80f4dbe"
        let parameters = "api_key=\(api_key)&brand=\(brand)&format=json&nojsoncallback=1"
        let url = "https://api.flickr.com/services/rest/?method="
        let method = "flickr.cameras.getBrandModels"
        let urlRequest = "\(url)\(method)&\(parameters)"
        activityIndicator.startAnimating()
        tableView.isHidden = true
        request = Alamofire.request(urlRequest, method: .get, parameters: nil, encoding:
            JSONEncoding.default, headers: nil).responseJSON { [weak self] response in
                //            print("URLRESPONSE")
                //            print(response)
                do {
                    let decoder = JSONDecoder()
                    let data1 = try decoder.decode(CameraResponse.self, from: response.data!)
                    print(data1.cameras.camera.count)
                    self?.cameras = data1.cameras.camera
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                    self?.tableView.isHidden = false
                    
                } catch {
                    print(error)
                    self?.activityIndicator.stopAnimating()
                }
        
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let camera = cameras[indexPath.row]
        if camera.details != nil {
            let detailCell = tableView.dequeueReusableCell(withIdentifier: "CameraInfoWithDetailsTableViewCell", for: indexPath) as! CameraInfoWithDetailsTableViewCell
        
            detailCell.setData(camera: camera)
            return detailCell
        }
    
//
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraInfoTableViewCell", for: indexPath) as! CameraInfoTableViewCell
        
        cell.setData(camera)
        return cell
    }

    // Метод, устанавливающий высоту ячейки таблицы
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let camera = cameras[indexPath.row]
        if camera.details != nil {
            return 100
        }
        return 60
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        request?.cancel()
        loadCamerasFromServer(brand: searchText)
    }
    
}
