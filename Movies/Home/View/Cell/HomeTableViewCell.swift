//
//  HomeTableViewCell.swift
//  Movies
//
//  Created by Kevin Morales on 9/29/22.
//  Copyright © 2022 Kevinho Morales. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var sinopsisLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    static let CELL_ID = "CELL_ID"
    
    func setUpView(movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        sinopsisLabel.text = movie.sinopsis
        voteAverageLabel.text = "\(movie.voteAverage)"
        let urlString = Constants.URL.urlImagesMovies + movie.image
        let url = URL(string: urlString)
        movieImageView.kf.setImage(with: url)
    }
    
}
