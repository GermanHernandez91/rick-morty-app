//
//  ModeledViewController.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol ModeledViewController: UIViewController, ViewModelDelegate {
    associatedtype AnyViewModel = ViewModel
    var viewModel: AnyViewModel? { get set }
    
    func setAsDelegate(for viewModel: ViewModel?)
}

extension ModeledViewController {
    
    func setAsDelegate(for viewModel: ViewModel?) {
        viewModel?.delegate = self
    }
}
