//
//  SegueHandlerType.swift
//  MandettaConcursos
//
//  Created by Rodolfo Roca on 11/6/18.
//  Copyright © 2018 JustWorks. All rights reserved.
//

import UIKit
import Foundation

public protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController,
    SegueIdentifier.RawValue == String
{

    public func performSegue(withIdentifier segueIdentifier: SegueIdentifier,
                                    sender: Any?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    public func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            
            fatalError("Invalid segue identifier \(segue.identifier ?? "").")
        }
        return segueIdentifier
    }
}
