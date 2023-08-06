//
//  DenemeViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 5.08.2023.
//

import UIKit



class DenemeViewController: UIViewController,SelectImageDelegate {
 
    
    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var showLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func selectScreenTapped(_ sender: Any) {
        let selectionVC =  storyboard?.instantiateViewController(withIdentifier: "delegateDetail") as! SelectImageViewController
        selectionVC.delegate = self
        present(selectionVC, animated: true)
    }
    func didSelectItem(imageName: String) {
        showImage.image = UIImage(systemName: imageName)
        showLabel.text = imageName
    }
}
