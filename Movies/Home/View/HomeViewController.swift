//
//  HomeViewController.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        getData()
        self.title = "Movies"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getData() {
        return viewModel.getlistMovieData()
        // Manejar la concurrencia o hilos de RXSwift
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
        // Subscribir a el Observable
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
            }, onError: { error in
                print("Error \(error.localizedDescription)")
            }, onCompleted: {
            }).disposed(by: disposeBag)
        // Dar por completado la secuencia de RXSwift
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.CELL_ID, for: indexPath) as! HomeTableViewCell
        let movie = movies[indexPath.row]
        cell.setUpView(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}
