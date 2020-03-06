//
//  AppCoordinator.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    weak var parentCoordiantor: Coordinator?
    
    var childCoordinator: Coordinator?
    var rootViewController: UIViewController
    
    let tabBarController = RMNavigationController()
    
    required init() {
        rootViewController = tabBarController
    }
}
