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
    @IBOutlet weak var searchBar: UISearchBar!
    var imageArray: [String] = ["trash","plus.rectangle.on.folder.fill","tray.circle.fill","externaldrive.fill","xmark.bin.circle.fill"]
    var filteredArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredArray = imageArray
    }
}

extension SelectImageViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        delegate.didSelectItem(imageName: filteredArray[indexPath.row])
    }
}

extension SelectImageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredArray = imageArray
            return
        }
        filteredArray = imageArray.filter {$0.contains(searchText.lowercased())}
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
