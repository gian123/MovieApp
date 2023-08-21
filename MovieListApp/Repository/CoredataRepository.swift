//
//  CoredataRepository.swift
//  MovieListApp
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation

import UIKit
import CoreData

class CoredataRepository {
   let context = AppDelegate.shared.persistentContainer.viewContext
    
    func saveMovieCoreData(withMovie movie: Result , page : String , totalPages: String) {
        let newMovie = MoviesCoreData(context: context)
        newMovie.identificator  =  String(movie.id!)
        newMovie.title = movie.title
        newMovie.release_date = movie.release_date
        newMovie.overview = movie.overview
        newMovie.poster_path = movie.poster_path
        newMovie.page  = page
        newMovie.vote_average  = movie.vote_average ?? 0.0
        newMovie.total_page = totalPages
          
        do {
            try context.save()
            
        } catch {
            
            fatalError("Failed to save: \(error)")
        }
    }
    
    func updateMovieCoreData(withMovie movie: Result,withImage image: UIImage ) {
        let newMovie = MoviesCoreData(context: context)
        newMovie.title = movie.title
        newMovie.imagePoster = image.pngData()
        
        let request = MoviesCoreData.fetchRequest()
        let predicate = NSPredicate(format: "identificator == %@", String(movie.id!))
        request.predicate = predicate
        
        
        do {
            
            let movieFound = try context.fetch(request)
            let objectUpdate = movieFound[0] as NSManagedObject
                       objectUpdate.setValue( image.pngData(), forKey: "imagePoster")
            print("movieFound--->",movieFound[0])
            
            do {
                try context.save()
                      }catch let error as NSError {
                          fatalError("Failed to save updated: \(error)")
                      }
        } catch {
            
            fatalError("Failed to save: \(error)")
        }
    }
    func getPageNumberMovieCoreData( completion: @escaping (String) -> Void) {
        
        do {
            
            let fetchRequest = MoviesCoreData.fetchRequest()
            fetchRequest.fetchLimit = 1
            let sortDescriptor = NSSortDescriptor(key: "page", ascending: false)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            do {
                      let recipes = try context.fetch(fetchRequest)
                      let max = recipes.first
                       completion(max?.page ?? "1")
                
                
               } catch {

                   
                 print(error.localizedDescription)
             
               }
            

        } catch {
            
            print(error.localizedDescription)
            
            fatalError("Failed to load data: \(error)")
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
            
            fatalError("Failed to load data: \(error)")
        }
    }
}

