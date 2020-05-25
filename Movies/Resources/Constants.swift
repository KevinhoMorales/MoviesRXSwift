//
//  Constants.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "91380f96fa2addf2dfb94d48397cf8da"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImagesMovies = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailMovies = "3/movie/"
    }
}
