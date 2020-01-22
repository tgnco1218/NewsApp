//
//  Article.swift
//  News
//
//  Created by KYT on 2020/1/22.
//  Copyright © 2020 tgnco1218. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
