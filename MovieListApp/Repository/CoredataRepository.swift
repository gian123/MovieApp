//
//  CoredataRepository.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

import UIKit

class CoredataRepository {
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    func saveMovieCoreData(withMovie movie: Result,withImage image: UIImage) {
        let newMovie = MoviesCoreData(context: context)
        newMovie.title = movie.title
        newMovie.release_date = movie.release_date
        newMovie.overview = movie.overview
        newMovie.poster_path = movie.poster_path
        newMovie.imagePoster = image.pngData()
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchCoraDataMovies(page: String,completion: @escaping ([MoviesCoreData]) -> Void) {
        do {
            let predicate = NSPredicate(format: "page == %@", page)
           
            let request = MoviesCoreData.fetchRequest()
            request.predicate = predicate
            let movies = try context.fetch(request)
            completion(movies)
        } catch {
            print(error.localizedDescription)
        }
    }
}

