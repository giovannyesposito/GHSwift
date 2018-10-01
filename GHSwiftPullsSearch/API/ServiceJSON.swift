//
//  ServiceJSON.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 18/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import Foundation
import UIKit
import TableViewReloadAnimation

class ServiceJSON {
    
    var jData = [Item]()
    
    
    func jsonDownload(tableView: UITableView) {
        guard let jsonURL = GlobalConstantes.jsonURLGH else {return}
        URLSession.shared.dataTask(with: jsonURL) { (data, jsonResponse, error) in
            guard let data = data, error == nil, jsonResponse != nil else {
                print(GlobalConstantes.somethingWrong)
                return
            }
            print(GlobalConstantes.downloadDone)
            do{
                let decoder = JSONDecoder()
                let jsonResp = try decoder.decode(ItemsJson.self, from: data)
                let jObejct = jsonResp.items
                self.jData = jObejct
                DispatchQueue.main.async {
                    tableView.reloadData()
                    tableView.reloadData(with: .simple(duration: 0.75, direction: .rotation3D(type: .daredevil),constantDelay:0.3))
                }
            }catch{
                print(GlobalConstantes.somethingWrong)
            }
            }.resume()
    }
}
