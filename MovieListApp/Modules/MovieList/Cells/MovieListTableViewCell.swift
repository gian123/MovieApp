//
//  MovieListTableViewCell.swift
//  TheMovieDBChallenge
//
//  Created by Jesus Gianfranco Gutierrez Jarra on 16/08/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    static let reusableIdentifier = String(describing: MovieListTableViewCell.self)
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
