//
//  MovieDetailViewController.swift
//  TheMovieDBChallenge
//
//  Created by Kevin Candia Villagómez on 8/03/23.
//

import UIKit
import Alamofire
import AlamofireImage
import Network


class MovieDetailViewController: UIViewController {
    
    var presenter: MovieDetailPresenterProtocol?

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    
    
    var networkCheck = NetworkCheck.sharedInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // navigationItem.largeTitleDisplayMode = .never
      
        detailView.dropShadow()
        presenter?.viewDidLoad()
        networkCheck.addObserver(observer: self)
        
  
    }

 
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func setData(data: Result?) {
        guard let posterPath = data?.poster_path, let movieTitle = data?.title, let date = data?.release_date, let average = data?.vote_average, let overview = data?.overview else { return }
      
        
        movieTitleLabel.text = movieTitle
        releaseDateLabel.text =  "Release date: " + date
        voteAverageLabel.text = String(average)
        overviewLabel.text = overview

       // if networkCheck.currentStatus == .satisfied {
          
            posterImageView.af.setImage(withURL: getUrl(posterPath))
        
        //  } else {
          
        //  if(data?.imagePoster != nil){
                    
        //    posterImageView.image = UIImage(data: data!.imagePoster!)
        //  }
        // }
       }
    
}
extension MovieDetailViewController: NetworkCheckObserver {
    func statusDidChange(status: NWPath.Status) {
        if status == .satisfied {
            //Do something
        }else if status == .unsatisfied {
            //Show no network alert
        }
    }
}
