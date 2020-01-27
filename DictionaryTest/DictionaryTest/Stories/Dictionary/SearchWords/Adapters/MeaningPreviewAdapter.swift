//
//  MeaningAdapter.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit

class MeaningPreviewAdapter {
    var text: String = ""
    var imageUrl: String = ""
    var meaningId: Int = 0
    
    init(meaningPreview: MeaningPreviewRO) {
        self.text = meaningPreview.translation ?? ""
        self.imageUrl = "https:" + (meaningPreview.previewUrl ?? "")
        self.meaningId = meaningPreview.meaningId ?? 0
    }
}
