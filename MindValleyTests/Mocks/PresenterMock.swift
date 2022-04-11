//
//  PresenterMock.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

@testable import MindValley

class PresenterMock: ChannelsInteractorOutputProtocol {
    var isEpisodesLoaded = false
    var isCategoriesLoaded = false
    var isChannelsLoaded = false
    
    var episodesCount = 0
    var categoiresCount = 0
    var channelsCount = 0
    
    func didFetchEpisodes(media: [EpisodesMedia]) {
        isEpisodesLoaded = true
        episodesCount = media.count
    }
    
    func didFetchCategoires(categoires: [Category]) {
        isCategoriesLoaded = true
        categoiresCount = categoires.count
    }
    
    func didFetchChannels(channels: [Channel]) {
        isChannelsLoaded = true
        channelsCount = channels.count
    }
}
