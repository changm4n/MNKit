//
//  MNRadioButtonManager.swift
//  WeeHan
//
//  Created by 이창민 on 2016. 5. 27..
//  Copyright © 2016년 UCAN. All rights reserved.
//

import UIKit

protocol MNRadioButtonManagerDelegate{
  func MNRadioButtonManagerDelegate(_ manager:MNRadioButtonManager ,didSelectedButtonAtIndex index:Int)
}

class MNRadioButtonManager: NSObject {

  
  var arrayOfButtons:[UIButton]!
  
  var tag:Int!
  
  var delegate:MNRadioButtonManagerDelegate?
  
  var noSelectable:Bool = false
  
  init(WithButtons btn:[UIButton]){
    super.init()
    arrayOfButtons = btn
    for button in arrayOfButtons!{
      button.addTarget(self, action: #selector(MNRadioButtonManager.buttonPressed(_:)), for: .touchUpInside)
      
    }
    
    selectButtonAtIndex(0)
    
  }
  
  
  func buttonPressed(_ sender:UIButton){
    
    
    
    if noSelectable == true{
      if sender.isSelected == true{
        deselectAll()
        self.delegate?.MNRadioButtonManagerDelegate(self, didSelectedButtonAtIndex: -1)
        return
      }
    }else{
      if sender.isSelected == true{
        return
      }
    }
    
    
    
    let index:Int = arrayOfButtons.index(of: sender)!
    sender.isSelected = true
    
    for button in arrayOfButtons!{
      
      if button === sender{
        
        continue
      }
      button.isSelected = false
      
    }
    self.delegate?.MNRadioButtonManagerDelegate(self, didSelectedButtonAtIndex: index)
  }
  
  
  func deselectAll(){
    for button in arrayOfButtons{
      button.isSelected = false
    }
  }
  
  func selectButtonAtIndex(_ index:Int){
    
    if index == -1{
      deselectAll()
      return
    }
    
    for button in arrayOfButtons{
      
      button.isSelected = false
      
      if button === arrayOfButtons[index]{
        button.isSelected = true
      }
      
    }
    self.delegate?.MNRadioButtonManagerDelegate(self, didSelectedButtonAtIndex: index)
  }

}
