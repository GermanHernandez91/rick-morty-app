//
//  CharactersCoordinator.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class CharactersCoordinator: Coordinator {
    weak var parentCoordiantor: Coordinator?

    var childCoordinator: Coordinator?
    var rootViewController: UIViewController

    var charactersVC: CharactersViewController

    required init() {
        charactersVC = CharactersViewController.instantiateFromStoryboard(with: CharactersViewModel())
        rootViewController = UINavigationController(rootViewController: charactersVC)
        
        prepare()
    }
    
    func prepare() {
        charactersVC.viewModel?.coordinator = self
    }
}
