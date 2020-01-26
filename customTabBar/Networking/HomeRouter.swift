//
//  HomeRouter.swift
//  customTabBar
//
//  Created by karim metawea on 1/26/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import Foundation
import Alamofire

enum HomeRouter: URLRequestConvertible {
    
    static let baseURLString = "http://bellman-bd.restart-technology.com/api"
    
    case fetchHome
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .fetchHome:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .fetchHome:
                return nil
            }
        }()
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .fetchHome:
                relativePath = HomeRouter.baseURLString + "/home"
           
            }
            
          
            return URL(string: relativePath!)!
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            return JSONEncoding.default
        }()
        return try! encoding.encode(urlRequest, with: params)
    }
}
