//
//  apiManager.swift
//  netzme
//
//  Created by Sandi Permata on 25/02/19.
//  Copyright © 2019 myProject. All rights reserved.
//

import Foundation


class apiManager {
    
    func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        request.httpMethod = method
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if (error != nil) {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                 completion(false, json as AnyObject)
            }
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject)
                } else {
                    completion(false, json as AnyObject)
                }
            }
            }.resume()
       
    }
    
    func post(request: NSMutableURLRequest, completion: @escaping (_ success: Bool,  _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    func put(request: NSMutableURLRequest, completion: @escaping (_ success: Bool,_ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    func get(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    func clientURLRequest(path: String, params: String) -> NSMutableURLRequest {
        
        let request = NSMutableURLRequest(url: NSURL(string: labelText.httpUrl+labelText.server_url+path)! as URL)
        
        request.httpBody = params.data(using: String.Encoding.utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(labelText.secureBasicAuth, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
}
