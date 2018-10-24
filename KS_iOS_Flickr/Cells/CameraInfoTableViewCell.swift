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
    
    // Метод заполнения ячейки таблицы данными - картинкой и текстом
    func setData(_ camera: Camera) {
        
        if camera.images != nil, let imagePath = camera.images?.getPathSmallImage() {
            let url = NSURL(string: imagePath)
            let imgData = try? Data(contentsOf: url! as URL)
            cameraImage.image = UIImage(data: imgData!)!
        } else {
            cameraImage.image = nil
        }
        cameraName.text = camera.name.toString()
    }
    
    
    
}
