//
//  EpisodesCoordinator.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class EpisodesCoordinator: Coordinator {
    weak var parentCoordiantor: Coordinator?
    
    var childCoordinator: Coordinator?
    var rootViewController: UIViewController
    
    var episodesVC: EpisodesViewController
    
    required init() {
        episodesVC = EpisodesViewController.instantiateFromStoryboard(with: EpisodesViewModel())
        rootViewController = UINavigationController(rootViewController: episodesVC)
        
        prepare()
    }
    
    func prepare() {
        episodesVC.viewModel?.coordinator = self
    }
}
