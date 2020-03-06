//
//  TestSceneDelegate.swift
//  RickMortyUniverseTests
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import XCTest
@testable import RickMortyUniverse

class TestSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: CoordinatorMock?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewController = UIViewController()
        let label = UILabel()
        
        label.text = "TESTING"
        label.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        viewController.view.addSubview(label)
        viewController.view.backgroundColor = .white
        
        label.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor).isActive = true
        
        coordinator = CoordinatorMock(rootViewController: viewController)
        
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
    }
}
