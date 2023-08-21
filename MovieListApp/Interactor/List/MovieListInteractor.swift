//
//  MovieListInteractor.swift

//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage



class MovieListInteractor: MovieListInteractorInputProtocol {
  
  
   
    // MARK: - Properties
    weak var presenter: MovieListInteractorOutputProtocol?
    var moviesLocal: MovieListResponse?
    var movies: MovieListResponse?
    var totalPages: String?
    
    func fetchMovies( page : String) {
        
        let currentPage  = "page=\(page)"
        let service = MovieRepository()
      
        
        service.fetchMovies(page: currentPage) { [weak self] listOfMovies in
            guard let self = self else { return }
            
            
            print("int total pages--->",String(listOfMovies?.total_pages ?? 1))
            print("int pages--->",page)
          
            self.totalPages = String(listOfMovies?.total_pages ?? 1)
            self.movies = listOfMovies
            self.presenter?.callBackDidGetMovies(data: listOfMovies)
            
            guard let resultsMovies = self.movies?.results else { return }
            resultsMovies.forEach { item in
                
                DispatchQueue.main.async {
                  
                    self.saveMovie( withMovie: item , page: page  , totalPages: self.totalPages!)
                }
                
            }
            
       }
    }
    
    func fetchCoreDataMovies(page : String) {
    
        let service = CoredataRepository()
        service.fetchCoraDataMovies(page: page){ [weak self] listOfCoreDataMovies in
            guard let self = self else { return }
            
            var movieResponse = MovieListResponse()
            
            var results = [Result]()
            
            print("conteo: \(listOfCoreDataMovies.count)")
            
            
            listOfCoreDataMovies.forEach { item in
                
                print("conteo item: \(item)")
                
                var itemRemote = Result()
                itemRemote.id =  Int(item.idt!)
                itemRemote.original_title = item.title
                itemRemote.overview = item.overview
                itemRemote.poster_path = item.poster_path
                itemRemote.release_date = item.release_date
                itemRemote.title = item.title
                itemRemote.vote_average = item.vote_average
                movieResponse.total_pages = Int(item.total_page ?? "1")
                
                results.append(itemRemote)
            }
            
            movieResponse.results = results
            
            
            
            
            self.presenter?.callBachDidGetCoreDataMovies(data: movieResponse)
        }
    }
    
    func saveMovie(withMovie item: Result , page : String , totalPages : String){
        
        let coreData = CoredataRepository()
        
        guard let posterPath = item.poster_path, let movieTitle = item.title, let date = item.release_date, let average = item.vote_average, let overview = item.overview else { return }
        let path = getUrl(posterPath)
        coreData.saveMovieCoreData(withMovie: item, page : page , totalPages: totalPages)
        
        AF.request( path,method: .get).response{ response in

           switch response.result {
               
              
            case .success(let responseData):
               
               
             //  guard let image = responseData else { return }
               let image =  UIImage(data: responseData!, scale:1)
               //    coreData.updateMovieCoreData(withMovie: item, withImage: image! )
               
            case .failure(let error):
                print("error--->",error)
            }
        }
    }
    func getPageNumberMovieCoreData() {
        
        let coreData = CoredataRepository()
      
        
        coreData.getPageNumberMovieCoreData() { [weak self] Page in
            guard let self = self else { return }
            self.presenter?.callBackPageDidGetCoreDataMovies(page : Page)
       }
        
        
        
       
    }
    
  
}
