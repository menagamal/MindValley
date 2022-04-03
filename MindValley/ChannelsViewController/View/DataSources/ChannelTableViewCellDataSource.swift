//
//  ChannelTableViewCell.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

class ChannelTableViewCellDataSource: NSObject {
    var tableView: UITableView!
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(
            UINib(nibName: "ChannelTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ChannelTableViewCell")
        self.tableView.reloadData()
    }
}

extension ChannelTableViewCellDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChannelTableViewCell",
            for: indexPath) as? ChannelTableViewCell else {
                return UITableViewCell()
        }
        cell.startShimmering()
        return cell
    }
}
