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
    
    var isConnectedToNetwork: Bool = NetworkReachabilityManager()?.isReachable ?? false
    
    func fetchEpisodes() {
        if isConnectedToNetwork {
            network?.fetchEpisodesFromServer(completion: { [weak self] response in
                let media = response.data.media
                self?.cacheManager?.cacheEpisodes(response: response)
                self?.presenter?.didFetchEpisodes(media: media)
            })
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
            network?.fetchChannelsFromServer(completion: { [weak self] response in
                let channels = response.data.channels
                self?.cacheManager?.cacheChannels(response: response)
                self?.presenter?.didFetchChannels(channels: channels)
            })
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
            network?.fetchCategoriesFromServer(completion: { [weak self] response in
                let categoires = response.data.categories
                self?.cacheManager?.cacheCategories(response: response)
                self?.presenter?.didFetchCategoires(categoires: categoires)
            })
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
