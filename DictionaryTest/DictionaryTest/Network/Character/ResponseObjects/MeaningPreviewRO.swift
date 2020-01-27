//
//  MeaningPreviewRO.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit
import ObjectMapper

class MeaningPreviewRO: Mappable {
    var meaningId: Int?
    var previewUrl: String?
    var translation: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        meaningId <- map["id"]
        previewUrl <- map["previewUrl"]
        translation <- map["translation.text"]
    }
    
}
