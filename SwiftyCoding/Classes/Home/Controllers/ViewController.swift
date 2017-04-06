//
//  ViewController.swift
//  SwiftyCoding
//
//  Created by duzhe on 2017/4/5.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView:UITableView!
  fileprivate var _dataProvider: ViewDataProvider!
  fileprivate lazy var dataManager = ViewDataManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI(){
    title = "首页"
    tableView.tableFooterView = UIView()
    tableView.separatorColor = UIColor.lightGray
    tableView.separatorInset = .zero
    tableView.rowHeight = 50
    
    tableView.easyRegisterNib(HomeTableViewCell.self)
    
    _dataProvider = ViewDataProvider()
    tableView.dataSource = _dataProvider
    tableView.delegate = _dataProvider
    
    dataManager.fetch(with: nil) { (result) in
      result.resSuccess({ [weak self] (items) in
        guard let strongSelf = self else { return }
        strongSelf._dataProvider.items = items
      })
    }
  }
  
}

