//
//  ViewController.swift
//  HeaderFooter
//
//  Created by Arpan Bhowmik on 12/1/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let data = [
        ["Apples", "Grapes", "Mangoes"],
        ["one", "two", "three", "four"],
        ["last one"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
                
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        header.backgroundColor = .green
        footer.backgroundColor = .orange
        
        let label = UILabel()
        label.text = "header"
        label.frame = header.bounds
        label.textAlignment = .center
        header.addSubview(label)
        
        let label2 = UILabel()
        label2.text = "footer"
        label2.frame = header.bounds
        label2.textAlignment = .center
        footer.addSubview(label2)
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    //HEADER FOOTER
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MyTableSectionHeaderView()
        header.configure(with: "Section \(section)")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer \(section)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
    }
}

