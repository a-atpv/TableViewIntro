//
//  TodoViewController.swift
//  AdilTableViewIntro
//
//  Created by Aldiyar Aitpayev on 10.07.2025.
//

import UIKit

class TodoViewController: UIViewController {
    
    var todos: [String] = ["task 1", "task2", "task3"]
    
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
        cell.nameLabel.text = todos[indexPath.row]
        return cell
    }
    
    
}

//class Todo{
//    name , duedate, isDone
//}
