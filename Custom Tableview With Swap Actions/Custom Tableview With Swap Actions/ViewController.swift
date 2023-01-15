//
//  ViewController.swift
//  Custom Tableview With Swap Actions
//
//  Created by Arpan Bhowmik on 13/1/23.
//

import UIKit

class User {
    let name: String
    var isFavourite: Bool
    var isMuted: Bool
    
    init(name: String, isFavourite: Bool, isMuted: Bool) {
        self.name = name
        self.isFavourite = isFavourite
        self.isMuted = isMuted
    }
}

class ViewController: UIViewController {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var users: [User] = [
        "Arpan Bhowmik",
        "John Doe",
        "Jack Kalis",
        "Don Smith",
        "Sara Jonshon"
    ].compactMap { User(name: $0, isFavourite: false, isMuted: false) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Swap Actions"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = user.name
        if user.isFavourite {
            cell.backgroundColor = .systemBlue
        } else if user.isMuted {
            cell.backgroundColor = .systemOrange
        } else {
            cell.backgroundColor = nil
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

//MARK: Swipe Action related tasks
extension ViewController {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let favouriteActionTitle = users[indexPath.row].isFavourite ? "UnFavourite" : "Favourite"
        let muteActionTitle = users[indexPath.row].isMuted ? "UnMute" : "Mute"
        
        let favouriteAction = UITableViewRowAction(style: .normal, title: favouriteActionTitle) { _, indexPath in
            self.users[indexPath.row].isFavourite.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let muteAction = UITableViewRowAction(style: .normal, title: muteActionTitle) { _, indexPath in
            self.users[indexPath.row].isMuted.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        favouriteAction.backgroundColor = .systemTeal
        muteAction.backgroundColor = .systemOrange
        
        return [deleteAction, favouriteAction, muteAction]
    }
}
