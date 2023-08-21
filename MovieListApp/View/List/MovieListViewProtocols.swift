//
//  MovieListViewProtocol.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 21/08/23.
//

import Foundation
import UIKit


protocol MovieListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MovieListPresenterProtocol? { get set }
    func reloadMoviesTable(withData data: MovieListResponse?)
    func pageCoreDataMoviesTable(withData data: String?)
}
protocol MovieListInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieListInteractorOutputProtocol? { get set }
    var movies: MovieListResponse? { get set }
    var moviesLocal: MovieListResponse? { get set }
    var totalPages: String? { get set }
    func fetchMovies( page : String)
    func fetchCoreDataMovies(page : String)
    func getPageNumberMovieCoreData()
}
protocol MovieListRouterProtocol {
    // PRESENTER -> ROUTER
    static func createMovieListModule() -> UIViewController
    
    func presentDetailView(from viewProtocol: MovieListViewProtocol, data: Result)
}

protocol MovieListPresenterProtocol {
    // VIEW -> PRESENTER
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorInputProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
        
    func getMovieList(page: String)
    func getCoreDataMovieList(page: String)
    func presentDetailView(data: Result)
    func filterList(_ text: String)
    func getPageNumberMovieCoreData()
}



protocol MovieListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func callBackDidGetMovies(data: MovieListResponse?)
    func callBachDidGetCoreDataMovies(data: MovieListResponse?)
    func callBackPageDidGetCoreDataMovies(page: String)
   
}
