//
//  APIRouter.swift
//  TheMovieDB
//
//  Created by Rish on 6/23/19.
//  Copyright © 2019 Rishil. All rights reserved.
//


import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getUpcomingMovieList
    case itunesMovieApp
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case  .getUpcomingMovieList,.itunesMovieApp :
            return .get
        }
    }
    
    
    //MARK:- encoding
    
    var encoding: ParameterEncoding {
        return method == .post ? URLEncoding() : JSONEncoding.prettyPrinted
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getUpcomingMovieList:
            return "movie/upcoming?api_key=\(apiKey)"
        case .itunesMovieApp:
            return "movie/upcoming?api_key=\(apiKey)"
        }
    }
    
    var fullURL: String {
        return K.ProductionServer.baseURL + path
    }
    
    
    var headers: HTTPHeaders {
        
        return ["Content-Type" :ContentType.json.rawValue]
    }
    
    
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getUpcomingMovieList,.itunesMovieApp :
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url:URL(string: K.ProductionServer.baseURL + path)! )
        
        
        
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
                return encodedURLRequest
            } catch  {
                
            }
        }
        return urlRequest
    }
}
