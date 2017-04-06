//
//  CompressImage.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/6.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit


class CompressImage {
  
  var strategy:CompressionImageStrategy
  
  init(strategy:CompressionImageStrategy) {
    self.strategy = strategy
  }
  
  func compressImage(image:UIImage)->UIImage?{
    return self.strategy.compressImage(image: image)
  }
  
}

