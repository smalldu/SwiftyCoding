//
//  ImageAssets.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

enum ImageAsset:String{
  case funnel = "home_nav_search"
  case my_publish = "my_publish"

}


extension ImageAsset{
  var image:UIImage?{
    return UIImage(named: self.rawValue)
  }
}


