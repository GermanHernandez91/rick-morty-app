//
//  CoordinatorMock.swift
//  RickMortyUniverseTests
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit
@testable import RickMortyUniverse

class CoordinatorMock: Coordinator {
    var parentCoordiantor: Coordinator?
    var childCoordinator: Coordinator?
    
    var rootViewController: UIViewController
    
    var dismissCalled = false
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    required init() {
        self.rootViewController = UIViewController()
    }
    
    func dismiss() {
        dismissCalled = true
    }
    
    func dismiss(_ completion: (() -> Void)?) {
        dismissCalled = true
        completion?()
    }
}
