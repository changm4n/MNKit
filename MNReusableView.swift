//
//  MNTableViewKit.swift
//  Donggam
//
//  Created by 이창민 on 2016. 7. 28..
//  Copyright © 2016년 UCAN. All rights reserved.
//

import Foundation
import UIKit


protocol ReusableView: class {}

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}


extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }

extension UITableView{
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
}
extension UICollectionView{
  
  func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
}
