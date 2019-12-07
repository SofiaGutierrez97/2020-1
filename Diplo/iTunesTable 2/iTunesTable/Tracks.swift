//
//  Tracks.swift
//  iTunesTable
//
//  Created by Jerriodas on 8/30/19.
//  Copyright © 2019 Jerriodas. All rights reserved.
//

import UIKit

struct Results: Codable{
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable{
    var trackName: String
}
