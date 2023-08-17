//
//  MovieRepository.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

class MovieRepository {
    
    // MARK : - Get Movies
    func fetchMovies(page : String ,completion: @escaping (MovieListResponse?) -> Void) {
        let url = Constants.fetchMoviesURL + page
        guard let url = URL(string: url) else { return }
        
        
        print("url\( url)")
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    let postResponse = try decoder.decode(MovieListResponse.self, from: data)
                    completion(postResponse)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

