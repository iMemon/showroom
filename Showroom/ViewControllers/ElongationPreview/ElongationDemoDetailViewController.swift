//
//  DetailViewController.swift
//  ElongationPreview
//
//  Created by Abdurahim Jauzee on 14/02/2017.
//  Copyright © 2017 Ramotion. All rights reserved.
//

import UIKit
import ElongationPreview


class ElongationDemoDetailViewController: ElongationDetailViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.backgroundColor = .black
    tableView.separatorStyle  = .none
    tableView.registerNib(GridViewCell.self)
    
    // Setup Showroom
    _ = MenuPopUpViewController.showPopup(on: self, url: Showroom.Control.elongationPreview.sharedURL) { [weak self] in
      self?.dismiss(animated: true, completion: nil)
      self?.dismiss(animated: true, completion: nil)
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(GridViewCell.self)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let appearance = ElongationConfig.shared
    let headerHeight = appearance.topViewHeight + appearance.bottomViewHeight
    let screenHeight = UIScreen.main.bounds.height
    return screenHeight - headerHeight
  }
  
}
