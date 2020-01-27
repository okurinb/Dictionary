//
//  SearchWordsViewModel.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit

class SearchWordsViewModel {
    let network = Network()
    private var searchResults: [(text: String, meanings: [MeaningPreviewAdapter])] = []
    
    func numberOfSections() -> Int {
        return searchResults.count
    }
    
    func numberOfElementsIn(section: Int) -> Int {
        return searchResults[section].meanings.count
    }
    
    func objectAt(indexPath: IndexPath) -> MeaningPreviewAdapter {
        return searchResults[indexPath.section].meanings[indexPath.row]
    }
    
    func textFor(section: Int) -> String {
        return searchResults[section].text
    }
    
    func search(text: String?, completion: @escaping ()->(), onError: @escaping (Error)->()) {
        self.network.cancelAll()
        if let searchText = text {
            self.network.requestArray(target: NetworkDictionary.search(text: searchText),
                                      responseObjectType: WordRO.self,
                                      success:
                { [weak self] (response) in
                    guard let `self` = self else { return }
                    self.searchResults = self.searchResultsWithResponse(response: response)
                    completion()
            }) { (error) in
                self.searchResults = []
                onError(error)
            }
        } else {
            self.searchResults = []
            completion()
        }
    }
    
    func searchResultsWithResponse(response: [WordRO]) -> [(text: String, meanings: [MeaningPreviewAdapter])] {
        return response.compactMap({($0.text ?? "",
                                     $0.meanings?.compactMap({MeaningPreviewAdapter(meaningPreview: $0)}) ?? [])})
    }
    
    
}
