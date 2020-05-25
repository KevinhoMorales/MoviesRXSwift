//
//  HomeRouter.swift
//  Movies
//
//  Created by Kevinho Morales on 5/25/20.
//  Copyright © 2020 Kevinho Morales. All rights reserved.
//

// Esta clase creara mi objecto Home pero tambien servira de Router para ir a otras vistas/pantallas
import Foundation
import UIKit

class HomeRouter {
    var viewController: UIViewController {
        return createViewControllet()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewControllet() -> UIViewController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {fatalError("Error desconocido")}
        self.sourceView = view
    }
}
