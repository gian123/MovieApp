//
//  MovieLoginViewProtocol.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 21/08/23.
//

import Foundation
import UIKit

protocol MovieLoginViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MovieLoginPresenterProtocol? { get set }
    
    func callBackWithNotSuccess()
}


protocol MovieLoginInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieLoginInteractorOutputProtocol? { get set }
    func callLogin(_ user: String, _ password: String)
    func callLogin2(_ user: String, _ password: String)
}

protocol MovieLoginRouterProtocol {
    // PRESENTER -> ROUTER
    static func createModule() -> UIViewController
    func presentListView(from viewProtocol: MovieLoginViewProtocol)
}


protocol MovieLoginPresenterProtocol {
    // VIEW -> PRESENTER
    var view: MovieLoginViewProtocol? { get set }
    var interactor: MovieLoginInteractorInputProtocol? { get set }
    var router: MovieLoginRouterProtocol? { get set }
    
    func callLogin(_ user: String, _ password: String)
}

protocol MovieLoginInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func callBackDidGetUser()
    func callBackDidGetError()
}
