//
//  HomeViewController.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies: BehaviorRelay<[Movie]> = BehaviorRelay(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        setUpView()
    }
    
    private func setUpView() {
        initView()
        // TableView - RxSwift
        setUpTableView()
        setUpDidSelectedTableView()
        setUpTableViewDelegate()
        getData()
    }
    
    private func initView() {
        self.title = "Movies"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpTableView() {
        movies.bind(to: tableView.rx.items(cellIdentifier: HomeTableViewCell.CELL_ID)) { row, model, cell in
            let newCell = cell as! HomeTableViewCell
            newCell.setUpView(movie: model)
        }.disposed(by: disposeBag)
    }
    
    private func setUpDidSelectedTableView() {
        tableView.rx.modelSelected(Movie.self)
            .map{ URL(string: Constants.URL.urlImagesMovies + $0.image) }
            .subscribe(onNext: { [weak self] url in
                guard let url = url else {
                    return
                }
                self?.present(SFSafariViewController(url: url), animated: true)
            }).disposed(by: disposeBag)
    }
    
    private func setUpTableViewDelegate() {
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func getData() {
        return viewModel.getlistMovieData()
        // Manejar la concurrencia o hilos de RXSwift
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
        // Subscribir a el Observable
            .subscribe(
                onNext: { movies in
                    self.movies.accept(movies)
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

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        165
    }

}
