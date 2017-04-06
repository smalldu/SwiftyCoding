//
//  Result.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import Foundation

enum Result<T> {
  
  case success(T)
  case failure(Error)
  
}


extension Result{
  @discardableResult
  func resSuccess(_ block:((T)->Void)){
    switch  self {
    case .success(let t):
      block(t)
    case .failure(_):
      print("--失败")
    }
  }
  
  
}
