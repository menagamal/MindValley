//
//  CachingManager.swift
//  MindValley
//
//  Created by Mena Gamal on 10/04/2022.
//

import Foundation
import Cache

class CachingManager: CachingManagerProtocol {
   
    private let diskConfig = DiskConfig(name: "Floppy")
    private let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
 
    private let CACHE_EPISODES_KEY = "EpisodesResponse"
    private let CACHE_CHANNELS_KEY = "ChannelsResponse"
    private let CACHE_CATEGORIES_KEY = "CategoriesResponse"

    func cacheEpisodes(response: EpisodesResponse) {
        cacheObject(response: response, key: CACHE_EPISODES_KEY)
    }

    func cacheChannels(response: ChannelsResponse) {
        cacheObject(response: response, key: CACHE_CHANNELS_KEY)
    }

    func cacheCategories(response: CategoriesResponse) {
        cacheObject(response: response, key: CACHE_CATEGORIES_KEY)
    }
    
    func fetchCachedEpisodes(completation: (EpisodesResponse?) -> Void) {
        fetchCachedObject(key: CACHE_EPISODES_KEY, completation: completation)
    }
    
    func fetchCachedChannels(completation: (ChannelsResponse?) -> Void) {
        fetchCachedObject(key: CACHE_CHANNELS_KEY, completation: completation)
    }
    
    func fetchCachedCategories(completation: (CategoriesResponse?) -> Void) {
        fetchCachedObject(key: CACHE_CATEGORIES_KEY, completation: completation)
    }
    
    private func fetchCachedObject<T: Codable>(key: String, completation: (T?) -> Void) {
        let storage = try? Storage<String, T>(
            diskConfig: self.diskConfig,
            memoryConfig: self.memoryConfig,
            transformer: TransformerFactory.forCodable(
                ofType: T.self))
        if let response = try? storage?.object(forKey: key) {
            completation(response)
        } else {
            completation(nil)
        }
    }
    private func cacheObject<T: Codable>(response: T, key: String) {
        do {
            let storage = try? Storage<String, T>(
                diskConfig: self.diskConfig,
                memoryConfig: self.memoryConfig,
                transformer: TransformerFactory.forCodable(
                    ofType: T.self))
            
            try storage?.setObject(response, forKey: key)
        } catch {
            print(error)
        }
    }
}


protocol CachingManagerProtocol {
    func cacheEpisodes(response: EpisodesResponse)
    func cacheChannels(response: ChannelsResponse)
    func cacheCategories(response: CategoriesResponse)
    
    func fetchCachedEpisodes(completation:(EpisodesResponse?) -> Void )
    func fetchCachedChannels(completation:(ChannelsResponse?) -> Void )
    func fetchCachedCategories(completation:(CategoriesResponse?) -> Void )
    
}
