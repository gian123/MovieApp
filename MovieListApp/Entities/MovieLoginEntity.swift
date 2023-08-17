//
//  MovieLoginEntity.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//
import Foundation

struct MovieLoginResponse: Decodable {
    let token: String?
    let user: [MovieUser]?
    let verified: Bool?
}

struct MovieUser: Decodable {
    let active: Bool?
    let name: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let phoneNumber: String?
}

