//
//  MNBarButtonItem.swift
//  WeeHan
//
//  Created by 이창민 on 2016. 6. 1..
//  Copyright © 2016년 UCAN. All rights reserved.
//

import UIKit

class MNBarButtonItem: UIBarButtonItem {
  fileprivate var actionHandler: ((Void) -> Void)?
  
  convenience init(title: String?, style: UIBarButtonItemStyle, actionHandler: ((Void) -> Void)?) {
    self.init(title: title, style: style, target: nil, action: nil)
    self.target = self
    self.action = #selector(MNBarButtonItem.barButtonItemPressed(_:))
    self.actionHandler = actionHandler
  }
  
  func barButtonItemPressed(_ sender: UIBarButtonItem) {
    if let actionHandler = self.actionHandler {
      actionHandler()
    }
  }

}
