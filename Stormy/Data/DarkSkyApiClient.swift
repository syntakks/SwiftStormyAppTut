//
//  DarkSkyApiClient.swift
//  Stormy
//
//  Created by Stephen Wall on 2/10/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import Foundation

class DarkSkyApiClient {
    fileprivate let darkSkyApiKey = "fdd87998038033d62b527326252ad4b8"
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    
}
