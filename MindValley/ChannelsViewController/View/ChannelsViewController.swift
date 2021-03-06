//
//  ChannelsViewController.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit

class ChannelsViewController: BaseViewController, ChannelsViewProtocol {
    @IBOutlet private weak var channelsTableView: UITableView!

    var presenter: ChannelsPresenterProtocol?
    private var dataSource: ChannelTableViewCellDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ChannelTableViewCellDataSource(tableView: channelsTableView, presenter: presenter)
        presenter?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension ChannelsViewController {
    func didLoadEpisodes() {
        dataSource?.reloadData()
    }
    func didLoadCategories() {
        dataSource?.reloadData()
    }
    func didLoadChannels() {
        dataSource?.reloadData()
    }
    
}
