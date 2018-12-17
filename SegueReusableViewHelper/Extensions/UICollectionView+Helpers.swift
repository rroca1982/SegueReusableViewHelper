//
//  UICollectionView+Helpers.swift
//  PlotTwist
//
//  Created by Rodolfo Roca on 12/4/18.
//  Copyright © 2018 Rodolfo Roca. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    public func register<T: UICollectionReusableView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let Nib = UINib.init(nibName: T.NibName, bundle: nil)
        register(Nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let Nib = UINib.init(nibName: T.NibName, bundle: nil)
        register(Nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
