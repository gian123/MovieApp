//
//  MovieDetailPresenter.swift
//  TheMovieDBChallenge
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation
import UIKit



class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    // MARK: - Properties
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorInputProtocol?
    var router: MovieDetailRouterProtocol?
    
    var data: Result?
    
    init(data: Result) {
        self.data = data
    }
    
    func viewDidLoad() {
        view?.setData(data:data)
    }
    
  
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func callBackDidGetSome() {
        
    }
    
    
}
