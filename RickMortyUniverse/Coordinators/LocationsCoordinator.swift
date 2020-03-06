//
//  LocationsCoordinator.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class LocationsCoordinator: Coordinator {
    weak var parentCoordiantor: Coordinator?
    
    var childCoordinator: Coordinator?
    var rootViewController: UIViewController
    
    var locationsVC: LocationsViewController
    
    required init() {
        locationsVC = LocationsViewController.instantiateFromStoryboard(with: LocationsViewModel())
        rootViewController = UINavigationController(rootViewController: locationsVC)
        
        prepare()
    }
    
    func prepare() {
        locationsVC.viewModel?.coordinator = self
    }
}
