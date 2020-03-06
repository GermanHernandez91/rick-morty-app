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
    
    let tabBarController = UITabBarController()
    let charactersCoordinator = CharactersCoordinator()
    let locationsCoordinator = LocationsCoordinator()
    let episodesCoordinator = EpisodesCoordinator()
    
    required init() {
        let characterItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3.fill"), tag: 1)
        let locationItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location.fill"), tag: 2)
        let episodeItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "book.fill"), tag: 3)
        
        charactersCoordinator.rootViewController.tabBarItem = characterItem
        locationsCoordinator.rootViewController.tabBarItem = locationItem
        episodesCoordinator.rootViewController.tabBarItem = episodeItem
        
        tabBarController.viewControllers = [
            charactersCoordinator.rootViewController,
            locationsCoordinator.rootViewController,
            episodesCoordinator.rootViewController,
        ]
        
        rootViewController = tabBarController
    }
}
