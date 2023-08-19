//
//  ViewController.swift
//  OurToDoList
//
//  Created by Tran Duc Tien on 19/08/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    var items = [String]()
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //khi view khởi tạo set items là mảng đc lưu từ lần trước, nếu mảng này rỗng thì set mặc định là mảng rỗng
        // lưu data vào localStore khi chạy lại app sẽ lấy giá trị được lưu dưới key - value[] để tiếp tục thực thi
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        print(self.items)
        title = "To Do List"
        // set như là 1 subview
        view.addSubview(table)
        // và bind data cho table la 1 view controller
        table.dataSource = self
        // tạo 1 button add
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    // là 1 callback của button add
    // thực thi các tác vụ hiển thị alert cho người dùng nhập vào.
    @objc private func didTapAdd(){
        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item!", preferredStyle: .alert)
        alert.addTextField{
            field in field.placeholder = "Enter item ...."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self]
            (_) in if let field = alert.textFields?.first{
                print(field)
                if let text = field.text, !text.isEmpty{
                    DispatchQueue.main.async {
                        // đọc giá trị items được lưu trong local
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                      
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                    
                }
            }
        }))
        present(alert,animated: true)
    }
        
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    // số hàng trong table view bằng số phần tử trong mảng array items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // tạo cell với id của cell là 1 string
    // set text tại cell
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
       
        return cell
    }
    
}

