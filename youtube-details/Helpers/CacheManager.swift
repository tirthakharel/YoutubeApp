//
//  CacheManager.swift
//  youtube-details
//
//  Created by Tirtha Kharel on 7/19/20.
//  Copyright © 2020 Tirtha Kharel. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
}
