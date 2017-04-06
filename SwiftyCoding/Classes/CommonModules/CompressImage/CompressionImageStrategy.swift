//
//  CompressionImageStrategy.swift
//  SwiftyCoding
//  压缩图片协议
//  Created by duzhe on 2017/4/6.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

protocol CompressionImageStrategy {
  func compressImage(image:UIImage) -> UIImage?
}

//MARK: - 压缩 0.9

struct CompressionOf0_9: CompressionImageStrategy {
  
  func compressImage(image: UIImage) -> UIImage? {
    if let data = UIImageJPEGRepresentation(image, 0.9) {
      return UIImage(data: data)
    }
    return nil
  }
  
}

//MARK: - 压缩到 200 K 以下

struct CompressionLessThan200k: CompressionImageStrategy {
  
  func compressImage(image: UIImage) -> UIImage? {
    if let data = UIImageJPEGRepresentation(image, 0.6) {
      let lowData = compressWithData(data)
      return UIImage(data: lowData)
    }
    return nil
  }
  
  func compressWithData(_ data:Data)->Data{
    let k = data.count/1024
    if k > 200 {
      // 如果大于200K继续压缩
      if let image = UIImage(data: data) {
        if let data = UIImageJPEGRepresentation(image, 0.8) {
          return compressWithData(data)
        }
      }
    }
    return data
  }
  
}
