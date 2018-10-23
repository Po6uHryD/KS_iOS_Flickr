//
//  CameraInfoTableViewCell.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 20.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import UIKit

class CameraInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var cameraName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(camera: Camera) {
        cameraName.text = camera.name.toString()
    }
}
