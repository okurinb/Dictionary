//
//  NetworkDictionary.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import Foundation
import Moya

enum NetworkDictionary {
    case search(text: String)
    case meaning(id: Int)
}

extension NetworkDictionary: TargetType {
    
    var baseURL: URL {
        return URL(string: AppURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return "words/search"
        case .meaning:
            return "meanings"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search(let text):
            return .requestParameters(parameters: ["search": text], encoding: URLEncoding.default)
        case .meaning(let id):
            return .requestParameters(parameters: ["ids": id], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["content-type": "application/json"]
    }
}
