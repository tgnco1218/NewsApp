//
//  CacheManager.swift
//  News
//
//  Created by KYT on 2020/1/22.
//  Copyright © 2020 tgnco1218. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        // Save the image data along with the URL
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
    
}
