//
//  WordDescriptionsViewModel.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit

class WordDescriptionsViewModel {
    private let network = Network()
    private (set) var meaning: MeaningAdapter?
    func loadMeaning(meaningId: Int, completion: @escaping ()->(), onError: @escaping (Error)->()) {
        
        self.network.requestArray(target: NetworkDictionary.meaning(id: meaningId),
                                  responseObjectType: MeaningRO.self,
                                  success:
            { [weak self] (response) in
                if let response = response.first {
                    self?.meaning = MeaningAdapter(meaning: response)
                }
                completion()
        }) { (error) in
            onError(error)
        }
    }
}
