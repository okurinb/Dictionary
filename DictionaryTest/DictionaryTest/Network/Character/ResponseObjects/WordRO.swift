//
//  WordRO.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit
import ObjectMapper

class WordRO: Mappable {
    var wordId: Int?
    var text: String?
    var meanings: [MeaningPreviewRO]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        wordId <- map["id"]
        text <- map["text"]
        meanings <- map["meanings"]
    }
}
