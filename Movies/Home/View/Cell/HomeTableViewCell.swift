//
//  HomeTableViewCell.swift
//  Movies
//
//  Created by Kevin Morales on 9/29/22.
//  Copyright © 2022 Kevinho Morales. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let CELL_ID = "CELL_ID"
    
    func setUpView(movie: Movie) {
        titleLabel.text = movie.title
        subtitleLabel.text = "Release Date: \(movie.releaseDate)"
    }
    
}
