//
//  NetworkMock.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

import Foundation
@testable import MindValley

class NetworkMock: ApiManagerProtocol {
    
    func fetchChannelsFromServer(completion: @escaping (ChannelsResponse) -> Void) {
        completion(ChannelsResponse())
    }
    
    func fetchCategoriesFromServer(completion: @escaping (CategoriesResponse) -> Void) {
        completion(CategoriesResponse())
    }
    
    func fetchEpisodesFromServer(completion: @escaping (EpisodesResponse) -> Void) {
        completion(EpisodesResponse())
    }

}
