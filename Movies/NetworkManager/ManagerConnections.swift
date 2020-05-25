//
//  ManagerConnections.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import Foundation
import RxSwift

class ManagerConnections {
    
    func getPopularMovies() -> Observable<[Movie]> {
        
        return Observable.create { obsever in
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.main + Constants.Endpoints.urlListPopularMovies)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        obsever.onNext(movies.listOfMovies)
                    } catch let error {
                        obsever.onError(error)
                        print("Ha ocurrido un error: \(error.localizedDescription)")
                    }
                } else if response.statusCode == 401 {
                    print("Esto es un error 401")
                }
                obsever.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    func getDetailMovies() {
        
    }
    
}
