//
//  Storyboarded.swift
//  RickMortyUniverse
//
//  Created by German Hernandez on 06/03/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol Storyboarded: ModeledViewController {
    static func instantiateFromStoryboard(with viewModel: ViewModel) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiateFromStoryboard(with viewModel: ViewModel) -> Self {
        let className = NSStringFromClass(self).components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: className) as! Self
        vc.viewModel = (viewModel as! Self.AnyViewModel)
        vc.setAsDelegate(for: viewModel)
        return vc
    }
}
