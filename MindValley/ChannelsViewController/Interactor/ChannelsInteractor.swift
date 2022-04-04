//
//  ChannelsInteractor.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation

class ChannelsInteractor: ChannelsInteractorInputProtocol {
    weak var presenter: ChannelsInteractorOutputProtocol?
    
    var network: ApiManagerProtocol?
    
    func fetchEpisodes() {
        network?.request(targetType: .fetchEpisodes, completion: { [weak self] (response: EpisodesResponse) in
            let media = response.data.media
            self?.presenter?.didFetchEpisodes(media: media)
        })
    }
    
    func fetchChannels() {
    }
    
    func fetchCategories() {
    }
    
    
}
