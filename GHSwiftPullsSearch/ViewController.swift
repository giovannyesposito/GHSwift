//
//  ViewController.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 14/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import UIKit
import TableViewReloadAnimation

class ViewController: ViewCellDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonConfig.jsonDownload(tableView: tableView)
    }
}


