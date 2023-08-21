//
//  MovieListEntity.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

struct MovieListResponse: Decodable {
    init()  {
        
    }
    var dates: Dates?
    var page: Int?
    var results: [Result]?
    var total_pages: Int?
    var total_results: Int?
}

// MARK: - Dates
struct Dates: Decodable{
    let maximum: String?
    let minimum: String?
}

// MARK: - Result
struct Result: Decodable {
    init()  {
       
    }
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    var imagePoster : Data?
    
}

