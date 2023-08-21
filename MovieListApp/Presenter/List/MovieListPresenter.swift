//
//  MovieListPresenter.swift
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation



class MovieListPresenter: MovieListPresenterProtocol {
   
    
    // MARK: - Properties
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorInputProtocol?
    var router: MovieListRouterProtocol?
    
    var filteredList: MovieListResponse?
    
    func getPageNumberMovieCoreData() {
        interactor?.getPageNumberMovieCoreData()
    }
    

    func getMovieList(page : String) {
        interactor?.fetchMovies(page : page)
    }
    
    func getCoreDataMovieList(page: String) {
        interactor?.fetchCoreDataMovies(page : page)
    }
    
    func presentDetailView(data: Result) {
        router?.presentDetailView(from: self.view!, data: data)
    }
    
    func filterList(_ text: String) {
        filteredList?.results?.removeAll()
        if text.count != 0 {
            for i in interactor?.movies?.results ?? [] {
                let range = i.title?.lowercased().range(of: text, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    filteredList?.results?.append(i)
                }
            }
        } else {
            filteredList = interactor?.movies
        }
        view?.reloadMoviesTable(withData: filteredList)
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
   
    
    func callBackPageDidGetCoreDataMovies(page: String) {
        view?.pageCoreDataMoviesTable(withData: page)
    }
    
    func callBackDidGetMovies(data: MovieListResponse?) {
        view?.reloadMoviesTable(withData: data)
    }
    
    func callBachDidGetCoreDataMovies(data: MovieListResponse?) {
        view?.reloadMoviesTable(withData: data)
    }
    
}
