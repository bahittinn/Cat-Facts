//
//  DenemeViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 5.08.2023.
//

import UIKit

protocol CounterDelegate: AnyObject {
    func counterPlus(count: Int)
}

class DenemeViewController: UIViewController,CounterDelegate {
    var delegate: CounterDelegate?
    var countter = 0
    func counterPlus(count: Int) {
        countter += 1
        print("dneme")
        labelCount.text = "\(countter)"
    }
        
    

    @IBOutlet weak var labelCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        DenemeViewController().delegate = self
    }
    @IBAction func buttonCount(_ sender: UIButton) {
        counterPlus(count: countter)
    }
}
 
