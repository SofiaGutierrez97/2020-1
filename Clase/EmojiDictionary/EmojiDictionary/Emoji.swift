//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Sofìa Gutièrrez on 9/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
