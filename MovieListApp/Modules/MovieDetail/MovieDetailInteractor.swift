//
//  MovieDetailInteractor.swift
//
//  Created by Kevin Candia Villagómez on 8/03/23.
//

import Foundation
import UIKit

protocol MovieDetailInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    
}

class MovieDetailInteractor: MovieDetailInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: MovieDetailInteractorOutputProtocol?
    
    
}
