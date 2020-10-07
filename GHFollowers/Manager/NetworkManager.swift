//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Billy Pak on 10/1/20.
//

import Foundation

class NetWorkManager{
    static let shared   = NetWorkManager()
    let baseURL         = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This usernamecreated an invalid request. Please try again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(nil, "unable to complete your request. Please check Internet Connection")
                return
            }
            
            
            // checking for response, if the response is nil, and status code is NOT 200, give invalid error
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. please try again")
                return
            }
            
            guard let data = data else {
                completed(nil, "the datat recieved from the server was invalid. please try again")
                return
            }
            
            //making sure we convert snake cases into camel cases
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch{
                completed(nil, "the data recieved from the server is invalid")
                
                
            }
            
        }
        
        //this starts the network call
        task.resume()
    }
}
