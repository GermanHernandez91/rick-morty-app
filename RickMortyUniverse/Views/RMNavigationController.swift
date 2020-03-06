//
//  RMNavigationController.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMNavigationController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUINavigationBar()
        viewControllers = [configureTabBarOne(), configureTabBarTwo(), configureTabBarThree()]
    }
    
    func configureUINavigationBar() {
        UITabBar.appearance().tintColor = .systemRed
    }
    
    func configureTabBarOne() -> UIViewController {
        let charactersCoordinator = CharactersCoordinator()
        let tabBarItem = UITabBarItem(title: NSLocalizedString("Characters", comment: ""), image: Constants.SFSymbols.people, tag: 1)
        
        charactersCoordinator.rootViewController.tabBarItem = tabBarItem
        
        return charactersCoordinator.rootViewController
    }
    
    func configureTabBarTwo() -> UIViewController {
        let locationsCoordinator = LocationsCoordinator()
        let tabBarItem = UITabBarItem(title: NSLocalizedString("Locations", comment: ""), image: Constants.SFSymbols.location, tag: 2)
        
        locationsCoordinator.rootViewController.tabBarItem = tabBarItem
        
        return locationsCoordinator.rootViewController
    }
    
    func configureTabBarThree() -> UIViewController {
        let episodesCoordinator = EpisodesCoordinator()
        let tabBarItem = UITabBarItem(title: NSLocalizedString("Episodes", comment: ""), image: Constants.SFSymbols.book, tag: 3)
        
        episodesCoordinator.rootViewController.tabBarItem = tabBarItem
        
        return episodesCoordinator.rootViewController
    }
}
