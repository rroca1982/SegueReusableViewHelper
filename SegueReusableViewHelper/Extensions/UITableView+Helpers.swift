//
//  UITableView+Helpers.swift
//  MandettaConcursos
//
//  Created by Rodolfo Roca on 11/14/18.
//  Copyright © 2018 JustWorks. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let Nib = UINib.init(nibName: T.NibName, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let Nib = UINib.init(nibName: T.NibName, bundle: nil)
        register(Nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableSection<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let sectionView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return sectionView
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
