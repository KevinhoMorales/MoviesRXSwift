//
//  Movies.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import Foundation

struct Movies: Codable {
    
    let listOfMovies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
    
}

struct Movie: Codable {
    
    let title: String
    let popularity: Double
    let movieID: Int
    let voteCount: Int
    let originalTitle: String
    let voteAverage: Double
    let sinopsis: String
    let releaseDate: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case popularity = "popularity"
        case movieID = "id"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
        
    }
}
