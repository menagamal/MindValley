//
//  InteractorMock.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//
@testable import MindValley
class InteractorMock: ChannelsInteractorInputProtocol {
    var presenter: ChannelsInteractorOutputProtocol?
    
    func fetchEpisodes() {
        presenter?.didFetchEpisodes(media: [EpisodesMedia()])
    }
    
    func fetchChannels() {
        presenter?.didFetchChannels(channels: [Channel()])
    }
    
    func fetchCategories() {
        let cat = Category()
        let result = [cat]
        presenter?.didFetchCategoires(categoires: result)
    }
    
    
}
