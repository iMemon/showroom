//
//  ViewController.swift
//  ElongationPreviewDemo
//
//  Created by Abdurahim Jauzee on 08/02/2017.
//  Copyright © 2017 Ramotion. All rights reserved.
//

import UIKit
import ElongationPreview


class ElongationDemoViewController: ElongationViewController {
  
  var datasource: [Villa] = Villa.testData
  
}

// MARK: - Lifecycle 🌎
extension ElongationDemoViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    
    // Setup Showroom
    _ = MenuPopUpViewController.showPopup(on: self, url: Showroom.Control.elongationPreview.sharedURL) { [weak self] in
      self?.dismiss(animated: true, completion: nil)
      self?.dismiss(animated: true, completion: nil)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    ThingersTapViewController.showPopup(on: self)
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
}

// MARK: - Setup ⛏
private extension ElongationDemoViewController {
  
  func setup() {
    tableView.backgroundColor = UIColor.black
    tableView.registerNib(DemoElongationCell.self)
  }
  
}

// MARK: - Actions ⚡
extension ElongationDemoViewController {
  
  override func openDetailView(for indexPath: IndexPath) {
    let detailViewController = ElongationDemoDetailViewController(style: UITableViewStyle.grouped)
    let villa = datasource[indexPath.row]
    detailViewController.title = villa.title
    expand(viewController: detailViewController)
  }
  
}

// MARK: - TableView 📚
extension ElongationDemoViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(DemoElongationCell.self)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    super.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    guard let cell = cell as? DemoElongationCell else { return }
    
    let villa = datasource[indexPath.row]
    
    let attributedLocality = NSMutableAttributedString(string: villa.locality.uppercased(), attributes: [
      NSFontAttributeName: UIFont.robotoFont(ofSize: 22, weight: .medium),
      NSKernAttributeName: 8.2,
      NSForegroundColorAttributeName: UIColor.white
      ])
    
    cell.topImageView?.image = UIImage(named: villa.imageName)
    cell.localityLabel?.attributedText = attributedLocality
    cell.countryLabel?.text = villa.country
    cell.aboutTitleLabel?.text = villa.title
    cell.aboutDescriptionLabel?.text = villa.description
  }
  
}
