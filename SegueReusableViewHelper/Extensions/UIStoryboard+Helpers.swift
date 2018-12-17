//
//  UIStoryboard+Helpers.swift
//  SegueReusableViewHelper
//
//  Created by Rodolfo Roca on 12/13/18.
//  Copyright © 2018 Rodolfo Roca. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    public func instantiateViewController<T: UIViewController>(withIdentifier identifier: String) -> T where T: StoryboardIDHandlerType {
        
        guard let controller = self.instantiateViewController(withIdentifier: T.storyboardID) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.storyboardID)")
        }
        return controller
    }
}
