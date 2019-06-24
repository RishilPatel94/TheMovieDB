//
//  Constant.swift
//  TheMovieDB
//
//  Created by Rish on 6/23/19.
//  Copyright © 2019 Rishil. All rights reserved.
//

import Foundation
import UIKit

let textBoxBorderColor = "EBEBEB"
let themeColor = "00A0BF"
let apiKey = "1f54bd990f1cdfb230adb312546d765d"




struct K {
    struct ProductionServer {
        static let baseURL = "https://api.themoviedb.org/3/"
    }
    
    struct ItunesURl{
        static let baseURL = "https://api.themoviedb.org/3/"
        static let imgBaseURL = "https://image.tmdb.org/t/p/w500/"
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded"
}



