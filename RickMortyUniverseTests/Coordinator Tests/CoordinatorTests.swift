//
//  CoordinatorTests.swift
//  RickMortyUniverseTests
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import XCTest
@testable import RickMortyUniverse

class TestCoordinator: Coordinator {
    var parentCoordiantor: Coordinator?
    var childCoordinator: Coordinator?
    var rootViewController: UIViewController
    
    let viewController: TestViewController
    
    required init() {
        viewController = TestViewController()
        rootViewController = viewController
        prepare()
    }
    
    func prepare() {
        viewController.viewModel?.coordinator = self
    }
    
    func dismiss() {
        dismissInternal()
    }
}

class TestViewController: UIViewController, ModeledViewController {
    var viewModel: ViewModel?
    
    var dismissCalled = false
    var presentCalled = false
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        dismissCalled = true
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        presentCalled = true
    }
}

class CoordinatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentingChildCoordinator() {
        let coordinator = TestCoordinator()
        let childCoord = TestCoordinator()
        
        XCTAssertNoThrow(try coordinator.present(childCoord))
        
        if let testController = coordinator.rootViewController as? TestViewController {
            XCTAssertTrue(testController.presentCalled)
        } else {
            XCTFail()
        }
    }
}
