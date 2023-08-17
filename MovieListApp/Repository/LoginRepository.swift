//
//  LoginRepository.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

class LoginRepository {
    // MARK: - POST Login
    func callLogin(completion: @escaping (MovieLoginResponse?) -> Void ) {
        let url = Constants.movieLoginURL
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    let postResponse = try decoder.decode(MovieLoginResponse.self, from: data)
                    completion(postResponse)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
}

