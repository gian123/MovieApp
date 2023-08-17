//
//  MovieListEntity.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

struct MovieListResponse: Decodable {
    let dates: Dates?
    let page: Int?
    var results: [Result]?
    let total_pages: Int?
    let total_results: Int?
}

// MARK: - Dates
struct Dates: Decodable{
    let maximum: String?
    let minimum: String?
}

// MARK: - Result
struct Result: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
}

