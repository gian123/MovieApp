//
//  MovieLoginInteractor.swift
//  TheMovieDBChallenge
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23..
//

import Foundation

protocol MovieLoginInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieLoginInteractorOutputProtocol? { get set }
    func callLogin(_ user: String, _ password: String)
    func callLogin2(_ user: String, _ password: String)
}

class MovieLoginInteractor: MovieLoginInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: MovieLoginInteractorOutputProtocol?
    var user: MovieLoginResponse?
    
    func callLogin(_ user: String, _ password: String) {
        let service = LoginRepository()
        service.callLogin { [weak self] loginResponse in
            guard let self = self else { return }
            self.user = loginResponse
            self.presenter?.callBackDidGetUser()
        }
    }
    
    func callLogin2(_ user: String, _ password: String) {
        if user == "adm" && password == "123" {
//        if user == "Admin" && password == "Password*123" {
            self.presenter?.callBackDidGetUser()
        } else {
            self.presenter?.callBackDidGetError()
        }
    }

    
}
