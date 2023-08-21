//
//  MovieDetailViewProtocol.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 21/08/23.
//



import Foundation
import UIKit


protocol MovieDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MovieDetailPresenterProtocol? { get set }
    func setData(data: Result?)
}
protocol MovieDetailInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    
}


protocol MovieDetailRouterProtocol {
    // PRESENTER -> ROUTER
    static func createMovieDetailModule(data: Result) -> UIViewController
}



protocol MovieDetailPresenterProtocol {
    // VIEW -> PRESENTER
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorInputProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }
    
    func viewDidLoad()
    
}

protocol MovieDetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER{AnyObject
    func callBackDidGetSome()
}
