//
//  SelectImageViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 7.08.2023.
//

import UIKit

protocol SelectImageDelegate {
    func didSelectItem(imageName: String)
}

class SelectImageViewController: UIViewController {
    var delegate: SelectImageDelegate!
    @IBOutlet weak var tableView: UITableView!
    var imageArray: [String] = ["trash","plus.rectangle.on.folder.fill","tray.circle.fill","externaldrive.fill","xmark.bin.circle.fill"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SelectImageViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = imageArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        delegate.didSelectItem(imageName: imageArray[indexPath.row])
    }
}
