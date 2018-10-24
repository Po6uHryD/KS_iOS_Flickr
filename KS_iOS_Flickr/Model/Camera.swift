//
//  Camera.swift
//  KS_iOS_Flickr
//
//  Created by Sergey Kiselev on 23.10.2018.
//  Copyright © 2018 aspb.pro.home. All rights reserved.
//

import Foundation

struct CameraResponse : Codable {
    let cameras : Cameras
}

struct Cameras : Codable {
    let brand : String
    let camera : [Camera]
}

struct Camera : Codable {
    let name : Content
    let details : Details?
    let images : Images?
}

struct Details : Codable {
    let megapixels : Content?
    let lcd_screen_size : Content?
    let memory_type : Content?
}

struct Images : Codable {
    let small : Content
    let large : Content
    func getPathSmallImage() -> String {
        return small.toString()
    }
    func getPathLargeImage() -> String {
        return large.toString()
    }
}

struct Content : Codable {
    let _content : String
    func toString() -> String {
        return _content
    }
}


