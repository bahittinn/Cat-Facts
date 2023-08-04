//
//  DetailViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 4.08.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    var detailItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.layer.cornerRadius = 8
        detailLabel.text = detailItem!
    }
}
