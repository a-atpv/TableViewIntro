//
//  TodoViewController.swift
//  AdilTableViewIntro
//
//  Created by Aldiyar Aitpayev on 10.07.2025.
//

import UIKit

class TodoViewController: UIViewController {
    
    var todos: [Todo] = [
        Todo(name: "Clean home", dueDate: Date(), isDone: true)
    ]
    
    lazy var toDoTable: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(ToDoUITableviewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(toDoTable)
        toDoTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    

}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ToDoUITableviewCell else { return UITableViewCell() }
        cell.delegate = self
        let task = todos[indexPath.row]
        cell.setUp(task: task)
        cell.index = indexPath.row
        return cell
    }
    
    
}

extension TodoViewController: ToDoUITableViewCellDelegate {
    
    func buttonTapped(at index: Int) {
        todos[index].isDone.toggle()
        toDoTable.reloadData()
    }
    
}

struct Todo {
    var name: String
    var dueDate: Date
    var isDone: Bool
}
