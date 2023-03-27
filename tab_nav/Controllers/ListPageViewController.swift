//
//  ViewController.swift
//  tab_nav
//
//  Created by Баэль Рыспеков on 25/3/23.
//

import UIKit
import SnapKit



class ListPageViewController: UIViewController {

    private var users: [User] = []
    private var filteredUser: [User] = []
    private var isFiltering = false
    private let searchBar = UISearchBar()
    
    private let tableView = UITableView()
    private let someView =  UIView ()
   
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
       initUI()
       initData()
    }

    func initUI(){
  
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search ..."
        searchBar.delegate = self
        view.backgroundColor = .white
      
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        view.addSubview(someView)
      
        someView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(36)
        }
        
        
        tableView.snp.makeConstraints { make in
       
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(someView.snp.bottom)
            make.bottom.equalToSuperview().offset(20)

            
        }
    }
    
    private func initData () {
        users = [
            User(id: "C0015",company: "ABC Company", name: "Jl. Merah Biru Nomor 123", email: "abccompany@email.com", number: +6281234567777),
            User(id: "C0016",company: "PQR Company", name: "Jl. Merah Biru Nomor 456", email: "pqrcompany@email.com", number: +6281234567888),
            User(id: "C0017",company: "XYZ Company", name: "Jl. Merah Biru Nomor 789", email: "xyzcompany@email.com", number: +6281234567890),
            
        ]
    }

}

extension ListPageViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredUser.count: users.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! UserTableViewCell
        
        if isFiltering {
            cell.setData(id: filteredUser[indexPath.row].id, company:  filteredUser[indexPath.row].company, name:  filteredUser[indexPath.row].name, email:  filteredUser[indexPath.row].email, number:  filteredUser[indexPath.row].number)
        }else{
            cell.setData(id: users[indexPath.row].id, company:  users[indexPath.row].company, name:  users[indexPath.row].name, email:  users[indexPath.row].email, number:  users[indexPath.row].number)
        }
    
        
   
        return cell
    }
    
}


extension ListPageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isFiltering = false
        }else{
            isFiltering = true
            filteredUser = users.filter({ $0.email.lowercased().contains(searchText.lowercased())})
        }
        tableView.reloadData()
    }
    
}
