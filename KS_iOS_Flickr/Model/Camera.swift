//
//  Camera.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 23.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import Foundation

struct Camera : Codable {
    let id : String
    let name : Content
}

struct Content : Codable {
    let _content : String
    func toString() -> String {
        return _content
    }
}

struct Cameras : Codable {
    let brand : String
    let camera : [Camera]
}

struct CameraResponse : Codable {
    let cameras : Cameras
}
