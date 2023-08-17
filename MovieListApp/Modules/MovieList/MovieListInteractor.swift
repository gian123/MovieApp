//
//  MovieListInteractor.swift
//  TheMovieDBChallenge
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

protocol MovieListInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieListInteractorOutputProtocol? { get set }
    var movies: MovieListResponse? { get set }
    func fetchMovies( page : String)
    func fetchCoreDataMovies(page : String)
}

class MovieListInteractor: MovieListInteractorInputProtocol {
    
    // MARK: - Properties
    weak var presenter: MovieListInteractorOutputProtocol?
    
    var movies: MovieListResponse?
    func fetchMovies( page : String) {
        
        let page  = "page=\(page)"
        let service = MovieRepository()
        service.fetchMovies(page: page) { [weak self] listOfMovies in
            guard let self = self else { return }
            self.movies = listOfMovies
            self.presenter?.callBackDidGetMovies(data: listOfMovies)
        }
    }
    
    func fetchCoreDataMovies(page : String) {
    
        let service = CoredataRepository()
        service.fetchCoraDataMovies(page: page){ [weak self] listOfCoreDataMovies in
            guard let self = self else { return }
            self.presenter?.callBachDidGetCoreDataMovies(data: listOfCoreDataMovies)
        }
    }
}
