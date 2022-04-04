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
    var presenter: ChannelsPresenterProtocol?
    
    init(tableView: UITableView, presenter: ChannelsPresenterProtocol?) {
        super.init()
        self.tableView = tableView
        self.presenter = presenter
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(
            UINib(nibName: "ChannelTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ChannelTableViewCell")
        self.tableView.reloadData()
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ChannelTableViewCellDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ChannelOverviewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let presenter = presenter {
            let section = ChannelOverviewSections(rawValue: section)
            switch section {
            case .episodes:
                return 1
            case .content:
                return 1
            case .categories:
                return 1
            case .none:
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ChannelOverviewSections(rawValue: indexPath.section)
        switch section {
        case .episodes:
            return episodesCell(tableView, cellForRowAt: indexPath)
        case .categories:
            return categoriesCell(tableView, cellForRowAt: indexPath)
        default:
            return courseCell(tableView, cellForRowAt: indexPath)
        }
    }
}
private extension ChannelTableViewCellDataSource {
    func courseCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChannelTableViewCell",
            for: indexPath) as? ChannelTableViewCell else {
                return UITableViewCell()
        }
        cell.configureContent()
        return cell
    }
    
    func episodesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChannelTableViewCell",
            for: indexPath) as? ChannelTableViewCell else {
                return UITableViewCell()
        }
        cell.configureForEpisodes(media: presenter?.episodes)
        return cell
    }
    
    func categoriesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChannelTableViewCell",
            for: indexPath) as? ChannelTableViewCell else {
                return UITableViewCell()
        }
        cell.configureCategories(categories: presenter?.categoires)
        return cell
    }
}

enum ChannelOverviewSections: Int, CaseIterable {
    case episodes
    case content
    case categories
}
