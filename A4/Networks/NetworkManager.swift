//
//  NetworkManager.swift
//  A4
//
//  Created by Ryan Park on 11/18/23.
//

import Foundation
import Alamofire
import Foundation

class NetworkManager {
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private init() { }
    
    /// Endpoint for dev server
    private let endpoint: String = "http://35.245.106.244"
    

    func getSessions(completion: @escaping ([Sesh]) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        AF.request(endpoint + "/api/sessions", method: .get)
            .validate()
            .responseDecodable(of: [Sesh].self, decoder: decoder) { response in
                switch response.result {
                case .success(let sessions):
                    print("Successfully fetched sessions")
                    completion(sessions)
                case .failure(let error):
                    print("Error in Networkmanager.getSessions:\(error.localizedDescription)")
                        completion([])
                }
            }
    }
  
    // TODO: Implement
//    func joinSession(sessionId: Int, completion: @escaping (Bool) -> Void) {
//        let parameters: Parameters = [
//            "Authorization": "Bearer 1234"
//        ]
//
//        AF.request("\(endpoint)/api/sessions/\(sessionId)", method: .post, parameters: parameters)
//            .validate()
//            .responseDecodable(of: Any, decoder: decoder) { response in
//                switch response.result {
//                case .success(let post):
//                    completion(true)
//                case .failure(let error):
//                    completion(false)
//                }
//            }
//
//    }


    
}
