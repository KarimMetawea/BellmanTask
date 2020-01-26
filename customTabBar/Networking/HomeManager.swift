//
//  HomeManager.swift
//  customTabBar
//
//  Created by karim metawea on 1/26/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import Foundation
import Alamofire

class HomeManager {

enum HomeManagerError: Error {
    case parseFailed
    case customError(message: String)
    case networkError
}

static func fetchLatestData( _ completionHandler: @escaping (Swift.Result<HomeModel, HomeManagerError>) -> Void) {
    let request = HomeRouter.fetchHome
    Alamofire.request(request).responseJSON { response in
        switch response.result {
        case let .success( value):
            print(value)
            guard let data = response.data else {
                completionHandler(.failure(HomeManagerError.networkError))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(HomeModel.self, from: data)
                completionHandler(.success(results))
            }catch{
                completionHandler(.failure(HomeManagerError.parseFailed))
            }
        case .failure:
            completionHandler(.failure(HomeManagerError.networkError))
        }
    }
}
}
