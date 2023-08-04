//
//  SelectViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 5.08.2023.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet var Views: [UIView]!
    @IBOutlet weak var catView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        catView.layer.cornerRadius = 8
        for view in Views {
            view.layer.cornerRadius = 8
        }
        // Do any additional setup after loading the view.
    }
    
 
}
