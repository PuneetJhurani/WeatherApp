//
//  NetworkClient.swift
//  NewYorkTimesArticleApp
//
//  Created by Nagarro on 20/02/24.
//

import Foundation


class NetworkClient {
    
    var defaultHeaders : [String : String]?
    var duration : UInt?
    var urlSession = URLSession(
        configuration: URLSessionConfiguration.default
    )
    
    public init(headers: [String: String]? , timeout: UInt) {
        self.defaultHeaders = headers
        self.duration = timeout
    }
    
    func get(url: URL, headers: [String: String], completion: @escaping(Data?,URLResponse?,Error?)    -> Void)  -> URLSessionDataTask  {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = TimeInterval(connectionTimeoutInMillis)
        let dataTask  = self.urlSession.dataTask(with: request, completionHandler: { data, response , error in
            print(data)
            completion(data,response,error)
        })
        return dataTask
    }
    
    func post (url: URL, body: Data?, headers: [String: String], completion: @escaping(Data?,Error?)  -> Void) -> URLSessionDataTask {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.timeoutInterval = TimeInterval(connectionTimeoutInMillis)
        let dataTask  = self.urlSession.dataTask(with: request, completionHandler: { data, response , error in
            
            completion(data,error)
        })
        return dataTask
        
    }
}
