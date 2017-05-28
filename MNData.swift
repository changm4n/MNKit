//
//  MNData.swift
//  Donggam
//
//  Created by 이창민 on 2016. 7. 29..
//  Copyright © 2016년 UCAN. All rights reserved.
//

import Foundation



func getDictFromJsonWithFilename(_ filename:String, ofType type:String)->[String:String]{
  var dict:[String:String]!
  
  if let path = Bundle.main.path(forResource: filename, ofType: type){
    let data = try? Data(contentsOf: URL(fileURLWithPath: path))
    do {
      let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
      dict = object as! [String:String]
    } catch {
      print("error")}
    
  }
  
return dict
  
}
