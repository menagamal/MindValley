//
//  ChannelsPresenter.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation

class ChannelsPresenter: BasePresenter, ChannelsPresenterProtocol {
    
    // Weak For Retain Cycle
    weak internal var view: ChannelsViewProtocol?
    var episodes: [Media]?
    
    private let interactor: ChannelsInteractorInputProtocol?
    private let router: ChannelsRouterProtocol

    init(view: ChannelsViewProtocol,
         interactor: ChannelsInteractorInputProtocol?,
         router: ChannelsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadData() {
        interactor?.fetchEpisodes()
    }
}

extension ChannelsPresenter: ChannelsInteractorOutputProtocol {
    func didFetchEpisodes(media: [Media]) {
        self.episodes = media
        self.view?.didLoadEpisodes()
    }
}
