import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var names = ["Adil", "Aldiyar", "Aya", "Aidana"]
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        view.backgroundColor = .white
        
        
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = names[indexPath.row]
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = .red
        }
        
        return cell
    }
    
    
}
