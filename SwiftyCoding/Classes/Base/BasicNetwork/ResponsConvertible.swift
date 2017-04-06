//
//  ResponsConvertible.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import Foundation

typealias ResponseComplete<T> = ( (Result<T>) -> Void )

protocol ResponseConvertible {
  
  associatedtype Target
  func fetch(with params:[String:Any]?,complete:ResponseComplete<Target>)
  
}

protocol RequestProtocol {
  func path() -> String
}
