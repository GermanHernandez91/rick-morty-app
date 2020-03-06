//
//  ViewModel.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import Foundation

protocol ViewModel: class {
    var coordinator: Coordinator? { get set }
    var delegate: ViewModelDelegate? { get set }
}

protocol ViewModelDelegate: class {
    func viewModelDidUpdate()
    func viewModelDidError(error: RMError)
    func viewModelNeedUpdate()
}

extension ViewModelDelegate {
    func viewModelDidUpdate() {}
    func viewModelDidError(error: RMError) {}
    func viewModelNeedUpdate() {}
}

class BaseViewModel: NSObject, ViewModel {
    weak var coordinator: Coordinator?
    weak var delegate: ViewModelDelegate?
    
    override init() {
        super.init()
    }
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init()
    }
}
