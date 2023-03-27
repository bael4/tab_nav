//
//  SearchBarViewController.swift
//  tab_nav
//
//  Created by Баэль Рыспеков on 26/3/23.
//

import UIKit

class SearchLocationViewController: UIViewController {

    private let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        view.backgroundColor = .yellow
    
    }
    


}
