//
//  ViewController.swift
//  Searchable TableView
//
//  Created by Arpan Bhowmik on 15/1/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var textField: UITextField!
    
    private var data = [String]()
    private var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    private func setUpData() {
        data.append("Arpan")
        data.append("John")
        data.append("Jenny")
        data.append("Luke")
        data.append("Simon")
        data.append("Lee")
        data.append("Dany")
        data.append("Karim")
        data.append("Johny")
        data.append("Raymond")
        data.append("Ijaj")
        
        filteredData = data
    }
    
    private func filterData(_ query: String?) {
        guard let query else { return }
        
        filteredData = data.filter{ $0.lowercased().hasPrefix(query.lowercased()) }
        tableView.reloadData()
    }
}

//MARK: Actions
extension ViewController {
    //This is a handy method for detecting current text in a text field
    @objc private func editingChanged(_ sender: UITextField) {
        filterData(sender.text)
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}
