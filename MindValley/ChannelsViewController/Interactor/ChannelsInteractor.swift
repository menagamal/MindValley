//
//  ChannelsInteractor.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import Cache
import Alamofire

class ChannelsInteractor: ChannelsInteractorInputProtocol {
   
    weak var presenter: ChannelsInteractorOutputProtocol?
    
    var network: ApiManagerProtocol?
    var cacheManager: CachingManagerProtocol?
    
    private var isConnectedToNetwork: Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func fetchEpisodes() {
        if isConnectedToNetwork {
            fetchEpisodesFromServer()
        } else {
            cacheManager?.fetchCachedEpisodes(completation: { response in
                if let response = response {
                    let media = response.data.media
                    self.presenter?.didFetchEpisodes(media: media)
                } else {
                    // HANDLE NO DATA
                }
            })
        }

    }
    
    func fetchChannels() {
        if isConnectedToNetwork {
            fetchChannelsFromServer()
        } else {
            cacheManager?.fetchCachedChannels(completation: { response in
                if let response = response {
                    let channels = response.data.channels
                    self.presenter?.didFetchChannels(channels: channels)
                } else {
                    // HANDLE NO DATA
                }
            })
        }
    }
    
    func fetchCategories() {
        if isConnectedToNetwork {
            fetchCategoriesFromServer()
        } else {
            cacheManager?.fetchCachedCategories(completation: { response in
                if let response = response {
                    let categoires = response.data.categories
                    self.presenter?.didFetchCategoires(categoires: categoires)
                } else {
                    // HANDLE NO DATA
                }
            })
        }
    }
    
}

private extension ChannelsInteractor {
    func fetchChannelsFromServer() {
        network?.request(targetType: .fetchChannels, completion: { [weak self] (response: ChannelsResponse) in
            let channels = response.data.channels
            self?.cacheManager?.cacheChannels(response: response)
            self?.presenter?.didFetchChannels(channels: channels)
        })
    }
    
    func fetchCategoriesFromServer() {
        network?.request(targetType: .fetchCategories, completion: { [weak self] (response: CategoriesResponse) in
            let categoires = response.data.categories
            self?.cacheManager?.cacheCategories(response: response)
            self?.presenter?.didFetchCategoires(categoires: categoires)
        })
    }
    
    
    func fetchEpisodesFromServer() {
        network?.request(targetType: .fetchEpisodes, completion: { [weak self] (response: EpisodesResponse) in
            guard let self = self else { return }
            let media = response.data.media
            self.cacheManager?.cacheEpisodes(response: response)
            self.presenter?.didFetchEpisodes(media: media)
        })
    }

}
