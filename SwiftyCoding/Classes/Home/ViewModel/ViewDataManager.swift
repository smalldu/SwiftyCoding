//
//  ViewDataManager.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import Foundation

struct ViewDataManager {
  
  // 此处本地返回
  func fetch(with params: [String : Any]?, complete: (Result<[String]>) -> Void) {
    complete( .success(["权限控制"]) )
  }
}

