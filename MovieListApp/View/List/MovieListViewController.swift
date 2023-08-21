//
//  MovieListController.swift
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import UIKit
import Network



class MovieListViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MovieListPresenterProtocol?
    let movieListTableView = UITableView()
   // let ofMovieListTableView = UITableView()
    var searchController = UISearchController()
    var elements: MovieListResponse?
    var ofElements = [MoviesCoreData]()
    var currentPage = 1
    
    // MARK: - Network check
    var networkCheck = NetworkCheck.sharedInstance()
    
    override func loadView() {
        super.loadView()
        networkCheck.addObserver(observer: self)
        setupUI()
        setupSearchBar()
        if networkCheck.currentStatus == .satisfied {
    
            callWebService(page: String(currentPage))
      
        } else {
          
            callCoreDataService(page: String(currentPage))
           
        }
        
    }
    
    private func setupUI() {
        // MARK: - ViewConfig
        view.backgroundColor = .white
        title = "List Of Movies"
        
        // MARK: - MovieList Contrainst
        view.addSubview(movieListTableView)
        //  view.addSubview(ofMovieListTableView)
        movieListTableView.translatesAutoresizingMaskIntoConstraints = false
        movieListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieListTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        movieListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        movieListTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
  
        // MARK: - Nib load
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        
        // MARK: - Regiter Nib
        movieListTableView.register(nib, forCellReuseIdentifier: MovieListTableViewCell.reusableIdentifier)
     
        
        // MARK: - tableViewDelegates
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
    
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Buscador"
        //navigationItem.searchController = searchController
    }
    
    private func callWebService(page : String) {
        presenter?.getMovieList(page : page)
    }
    
    private func callCoreDataService(page : String) {
        presenter?.getCoreDataMovieList(page : page)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return elements?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reusableIdentifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        let data = elements?.results?[indexPath.row]
        cell.overviewLabel.text = data?.overview
        cell.titleMovieLabel.text = data?.title
        cell.releaseDateLabel.text = data?.release_date
        cell.voteAverageLabel.text = String(format: "%.1f", data?.vote_average ?? 0.0)
        cell.posterImageView.af.setImage(withURL: getUrl(data?.poster_path ?? ""))
  
        
       // if networkCheck.currentStatus == .satisfied {
          
         
        //   } else {
          
        //    if(data?.imagePoster != nil){
                    
        //  cell.posterImageView.image = UIImage(data: data!.imagePoster!)
        //  }
           
        //  }
        
        return cell
        
        }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     
        
        let lastItem = elements?.results?.count ?? 0
          if indexPath.row == lastItem - 1 {
              print("IndexRow\(indexPath.row)")
              
              guard let pages = elements?.total_pages else { return }
              if(self.currentPage <= pages){
                  
                  if networkCheck.currentStatus == .satisfied {
                     callWebService(page: String(currentPage))
                  } 
                  
              }
            
              
          }
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let item = elements?.results?[indexPath.row] else { return }
        presenter?.presentDetailView(data: item)
    }
    
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        presenter?.filterList(text)
    }
}

extension MovieListViewController: MovieListViewProtocol {
    
    func pageCoreDataMoviesTable(withData data: String?) {
        
        self.currentPage = Int(data!) ?? 1
    }
    
    func reloadMoviesTable(withData data: MovieListResponse?) {
     
        if self.elements == nil {
            self.elements = data
        }
        
   
       
        
        guard let count = data?.results?.count else { return }
        if(count > 0){
           self.elements?.results?.append(contentsOf: data!.results!)
        }
        guard let pages = elements?.total_pages else { return }
        if(self.currentPage <= pages){
           self.currentPage += 1
         
        }
          DispatchQueue.main.async {
            self.movieListTableView.reloadData()
            
        }
    }
    
  
}

extension MovieListViewController: NetworkCheckObserver {
    func statusDidChange(status: NWPath.Status) {
        if status == .satisfied {
            //Do something
        }else if status == .unsatisfied {
            //Show no network alert
        }
    }
}
