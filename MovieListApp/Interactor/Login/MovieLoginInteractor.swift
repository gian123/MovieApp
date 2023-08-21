//
//  MovieLoginInteractor.swift
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23..
//

import Foundation


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
    
        
    if user == "Admin" && password == "Password*123" {
        //  if user == "123" && password == "123" {
            self.presenter?.callBackDidGetUser()
        } else {
            self.presenter?.callBackDidGetError()
        }
    }

    
}
