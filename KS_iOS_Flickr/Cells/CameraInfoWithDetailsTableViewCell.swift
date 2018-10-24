//
//  CameraInfoWithDetailsTableViewCell.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 20.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import UIKit

class CameraInfoWithDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var cameraName: UILabel!
    @IBOutlet weak var megapixels: UILabel!
    @IBOutlet weak var screensize: UILabel!
    @IBOutlet weak var memorytype: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(camera: Camera) {
        
        if camera.images != nil, let imagePath = camera.images?.getPathLargeImage() {
            let url = NSURL(string: imagePath)
            let imgData = try? Data(contentsOf: url! as URL)
            cameraImage.image = UIImage(data: imgData!)!
        } else {
            cameraImage.image = nil
        }

        cameraName.text = camera.name.toString()
        megapixels.text = camera.details?.megapixels?.toString()
        screensize.text = camera.details?.lcd_screen_size?.toString()
        memorytype.text = camera.details?.memory_type?.toString()
    }
    
}
