//
//  ViewController.swift
//  Cat-Facts
//
//  Created by Bahittin on 4.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let urlString = "https://cat-fact.herokuapp.com/facts"
    var catfacts = [Facts]()
    var selectedItem: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchData() {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let jsonData = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                    return
                }
                if let data = data {
                    self.parseJson(data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            jsonData.resume()
        }
    }
    func parseJson(_ jsonData: Data) {
        let decoder = JSONDecoder()
        let facts = try? decoder.decode([Facts].self, from: jsonData)
        catfacts = facts!
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catfacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell",for: indexPath)
        let fact = catfacts[indexPath.row]
        cell.textLabel?.text = fact.text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = catfacts[indexPath.row].text
        performSegue(withIdentifier: "detailSG", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.detailItem = selectedItem
    }
}

