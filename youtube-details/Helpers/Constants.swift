//
//  Constants.swift
//  youtube-details
//
//  Created by Tirtha Kharel on 7/19/20.
//  Copyright © 2020 Tirtha Kharel. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyCVa8hMdoeVx64tlbL0d8WFEOsnYgNh3bE"
    static var PLAYLIST_ID = "PLx0sYbCqOb8QTF1DCJVfQrtWknZFzuoAE"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://youtube.com/embed/"
    
}
