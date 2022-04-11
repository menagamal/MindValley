//
//  CacheManagerMock.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

import Foundation
@testable import MindValley

class CacheManagerMock: CachingManagerProtocol {
    
    var didCacheEpisodes = false
    var didCacheChannels = false
    var didCacheCategories = false
    
    var didFetchEpisodes = false
    var didFetchChannels = false
    var didFetchCategories = false
    
    func cacheEpisodes(response: EpisodesResponse) {
        didCacheEpisodes = true
    }
    
    func cacheChannels(response: ChannelsResponse) {
        didCacheChannels = true
    }
    
    func cacheCategories(response: CategoriesResponse) {
        didCacheCategories = true
    }
    
    func fetchCachedEpisodes(completation: (EpisodesResponse?) -> Void) {
        didFetchEpisodes = true
        completation(EpisodesResponse())
    }
    
    func fetchCachedChannels(completation: (ChannelsResponse?) -> Void) {
        didFetchChannels = true
        completation(ChannelsResponse())
    }
    
    func fetchCachedCategories(completation: (CategoriesResponse?) -> Void) {
        didFetchCategories = true
        completation(CategoriesResponse())
    }
    
    
}


