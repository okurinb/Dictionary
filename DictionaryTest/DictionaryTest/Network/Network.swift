//
//  Network.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 24.01.2020.
//  Copyright © 2020 Борис Окурин. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct AppURL {
    static let baseURL = "https://dictionary.skyeng.ru/api/public/v1/"
}

class Network {
    private var requests: [Cancellable] = []
    private let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])
    
    func cancelAll() {
        for request in self.requests {
            request.cancel()
        }
        self.requests.removeAll()
    }
    
    func requestArray<T: TargetType, R: Mappable>(target: T, responseObjectType: R.Type, success successCallback: @escaping ([R]) -> Void, error errorCallback: @escaping (Swift.Error) -> Void) {
        
        let request = provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300,
                    let responseString = String(data: response.data, encoding: String.Encoding.utf8) as String? {
                    if let responseObjects = Array<R>(JSONString: responseString){
                        successCallback(responseObjects)
                    } else {
                        let error = NSError(domain:AppURL.baseURL, code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                        errorCallback(error)
                    }
                } else {
                    let error = NSError(domain:AppURL.baseURL, code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
        self.requests.append(request)
    }
}
