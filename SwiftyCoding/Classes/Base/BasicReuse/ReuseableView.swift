//
//  ReuseableView.swift
//  SwiftyCoding
//  复用tableviewcell
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

protocol ReusableView:class {}

extension ReusableView where Self:UIView{
  static var reuseIdentifier:String{
    return String(describing: self)
  }
}

extension UITableViewCell:ReusableView{}

protocol NibLoadableView:class {}

extension NibLoadableView where Self:UIView{
  static var NibName:String{
    return String(describing: self)
  }
}

extension UITableViewCell:NibLoadableView{}

extension UITableView{
  
  func easyRegisterNib<T:UITableViewCell>(_:T.Type) where T:ReusableView, T:NibLoadableView{
    let Nib = UINib.init(nibName: T.NibName, bundle: nil)
    register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func easyRegisterClass<T:UITableViewCell>(_:T.Type) where T:ReusableView, T:NibLoadableView{
    register(T.self , forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func easyDequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath:IndexPath)->T where T:ReusableView{
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell withidentifier : \(T.reuseIdentifier)")
    }
    return cell
  }
}
