//
//  ViewDataProvider.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit


class ViewDataProvider: NSObject , UITableViewDataSource , UITableViewDelegate {
  weak var tableView:UITableView!
  var items:[String] = []{
    didSet{
      self.tableView?.reloadData()
    }
  }
  
  override init() {
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.easyDequeueReusableCell(forIndexPath: indexPath) as HomeTableViewCell
    cell.titleLabel.text = self.items[ indexPath.row ]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

