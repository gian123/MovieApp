//
//  ListPresenterMock.swift
//  MovieListAppTests
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 21/08/23.
//

import Foundation
import XCTest
@testable import MovieListApp

class ListPresenterMock : MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    
    var interactor: MovieListInteractorInputProtocol?
    
    var router: MovieListRouterProtocol?
    
    func getMovieList(page: String) {
     
    }
    
    func getCoreDataMovieList(page: String) {
    
    }
    
    func presentDetailView(data: Result) {
        
    }
    
    func filterList(_ text: String) {
        
    }
    
    func getPageNumberMovieCoreData() {
        
    }
    
    

    
    
    
}
    
    
    
