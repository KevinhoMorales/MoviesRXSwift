//
//  HomeViewModel.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    
    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        //bindear el router con la vista
        self.router?.setSourceView(view)
    }
    
}
