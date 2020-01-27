//
//  MeaningAdapter.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit

class MeaningAdapter {
    var text: String = ""
    var translation: String = ""
    var imageUrl: String = ""
    
    init(meaning: MeaningRO) {
        self.text = meaning.text ?? ""
        self.translation = meaning.translation ?? ""
        self.imageUrl = "https:" + (meaning.imagesUrl ?? "")
    }
}
