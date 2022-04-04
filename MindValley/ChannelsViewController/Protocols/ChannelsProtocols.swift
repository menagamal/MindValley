//
//  ChannelsProtocols.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

//MARK: View -
protocol ChannelsViewProtocol: AnyObject {
    var presenter: ChannelsPresenterProtocol?  { get set }
    func didLoadEpisodes()
}
//MARK: Presenter -
protocol ChannelsPresenterProtocol: AnyObject {
    var view: ChannelsViewProtocol?  { get set }
    func loadData()
    var episodes:[Media]?  { get set }
}

//MARK: Interactor -
protocol ChannelsInteractorOutputProtocol: AnyObject {
    func didFetchEpisodes(media: [Media]) 
}
protocol ChannelsInteractorInputProtocol: AnyObject {
    var presenter: ChannelsInteractorOutputProtocol?  { get set }
    func fetchEpisodes()
    func fetchChannels()
    func fetchCategories()
}

//MARK: Router -
protocol ChannelsRouterProtocol: AnyObject {
    var view: UIViewController! { get set }
}
