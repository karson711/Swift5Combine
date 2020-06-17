//
//  NewsModel.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/12.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

struct  NewsModel : Codable{
    var reason: String?
    var error_code: Int?
    var result:Result?
}

struct Result: Codable {
    var stat:String?
    var data:[DataItem]?
}

struct DataItem: Codable {
    var uniquekey: String?
    var title: String?
    var date: String?
    var category: String?
    var author_name: String?
    var url: String?
    var thumbnail_pic_s: String?
    var thumbnail_pic_s02: String?
    var thumbnail_pic_s03: String?
}
