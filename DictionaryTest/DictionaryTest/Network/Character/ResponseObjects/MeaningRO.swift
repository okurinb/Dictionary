//
//  MeaningRO.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit
import ObjectMapper

class MeaningRO: Mappable {
    var meaningId: Int?
    var wordId: Int?
    var text: String?
    var translation: String?
    var imagesUrl: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        meaningId <- map["id"]
        wordId <- map["wordId"]
        text <- map["text"]
        translation <- map["translation.text"]
        imagesUrl <- map["images.0.url"]
    }
    
}
