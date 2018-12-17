//
//  StoryboardIDHandlerType.swift
//  SegueReusableViewHelper
//
//  Created by Rodolfo Roca on 12/12/18.
//  Copyright © 2018 Rodolfo Roca. All rights reserved.
//

import UIKit
import Foundation


public protocol StoryboardIDHandlerType { }

extension StoryboardIDHandlerType where Self: UIViewController {
    
    public static var storyboardID: String {
        return String.init(describing: self)
    }
}
