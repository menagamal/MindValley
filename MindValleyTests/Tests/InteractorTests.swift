//
//  InteractorTests.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

import XCTest
@testable import MindValley

class InteractorTests: XCTestCase {

    var interactor: ChannelsInteractor!
    var cacheManager = CacheManagerMock()
    var presenter = PresenterMock()
    var network = NetworkMock()
    override func setUp() {
        super.setUp()
        interactor = ChannelsInteractor()
        interactor.presenter = presenter
        interactor.cacheManager = cacheManager
        interactor.network = network
    }
    
    func testDidFetchEpisodesFromNetwork() {
        interactor.isConnectedToNetwork = true
        interactor.fetchEpisodes()
        XCTAssertTrue(cacheManager.didCacheEpisodes)
        XCTAssertTrue(presenter.isEpisodesLoaded)
        XCTAssertEqual(presenter.episodesCount, 1)
    }
    
    func testDidFetchChannelsFromNetwork() {
        interactor.isConnectedToNetwork = true
        interactor.fetchChannels()
        XCTAssertTrue(cacheManager.didCacheChannels)
        XCTAssertTrue(presenter.isChannelsLoaded)
        XCTAssertEqual(presenter.channelsCount, 1)
    }
    
    func testDidFetchCategoriesFromNetwork() {
        interactor.isConnectedToNetwork = true
        interactor.fetchCategories()
        XCTAssertTrue(cacheManager.didCacheCategories)
        XCTAssertTrue(presenter.isCategoriesLoaded)
        XCTAssertEqual(presenter.categoiresCount, 1)
    }
    
    func testDidFetchEpisodesFromCache() {
        interactor.isConnectedToNetwork = false
        interactor.fetchEpisodes()
        XCTAssertTrue(cacheManager.didFetchEpisodes)
        XCTAssertTrue(presenter.isEpisodesLoaded)
        XCTAssertEqual(presenter.episodesCount, 1)
    }
    
    func testDidFetchChannelsFromCache() {
        interactor.isConnectedToNetwork = false
        interactor.fetchChannels()
        XCTAssertTrue(cacheManager.didFetchChannels)
        XCTAssertTrue(presenter.isChannelsLoaded)
        XCTAssertEqual(presenter.channelsCount, 1)
    }
    
    func testDidFetchCategoriesFromCache() {
        interactor.isConnectedToNetwork = false
        interactor.fetchCategories()
        XCTAssertTrue(cacheManager.didFetchCategories)
        XCTAssertTrue(presenter.isCategoriesLoaded)
        XCTAssertEqual(presenter.categoiresCount, 1)
    }
}
