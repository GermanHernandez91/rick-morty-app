//
//  Coordinator.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var parentCoordiantor: Coordinator? { get set }
    var childCoordinator: Coordinator? { get set }
    var rootViewController: UIViewController { get }
    
    init()
}

extension Coordinator {
    
    func present(_ child: Coordinator, animated: Bool = true, completion: (() -> Void)? = nil) throws {
        guard childCoordinator == nil else {
            print("Can't present child on coordinator that already has child")
            throw CoordinatorError.childAlreadyExists
        }
        
        childCoordinator = nil
        child.parentCoordiantor = self
        
        rootViewController.present(child.rootViewController, animated: animated) {
            completion?()
        }
    }
    
    func show(viewController: UIViewController) {
        if let navController = rootViewController as? UINavigationController {
            navController.pushViewController(viewController, animated: true)
        } else {
            print("Attempting to push view controller on to rootViewController that is not of type UINavigationController")
        }
    }
    
    
    func dismiss(_ animated: Bool = true, completion: (() -> Void)? = nil) {
        try? parentCoordiantor?.remove(self)
        parentCoordiantor = nil
        rootViewController.dismiss(animated: animated) {
            try? self.parentCoordiantor?.remove(self)
            self.parentCoordiantor = nil
            completion?()
        }
    }
    
    
    func remove(_ child: Coordinator) throws {
        guard child.rootViewController === childCoordinator?.rootViewController else {
            print("Attempting to remvoe child from coordinator with non matching child type")
            throw CoordinatorError.childTypeMistmatch
        }
        
        childCoordinator = nil
    }
}
