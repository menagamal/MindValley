//
//  ChannelsPresenterTests.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

import XCTest
@testable import MindValley

class ChannelsPresenterTests: XCTestCase {
    
    var presenter: ChannelsPresenter!
    var viewMock: ViewMock!
    var routerMock: RouterMock!
    var interactorMock: InteractorMock!
    
    override func setUp() {
        super.setUp()
        viewMock = ViewMock()
        routerMock = RouterMock()
        interactorMock = InteractorMock()
        presenter = ChannelsPresenter(view: viewMock,
                                      interactor: interactorMock,
                                      router: routerMock)
        interactorMock?.presenter = presenter
        presenter.loadData()
    }
    
     override func tearDown() {
        super.tearDown()
         presenter = nil
    }
    
    func testLoadEpisodes() {
        if let episodes = presenter.episodes {
            XCTAssertTrue(!episodes.isEmpty)
            XCTAssertTrue(viewMock.isEpisodesLoaded)
        } else {
            XCTFail("Error While Loading Data")
        }
    }
    
    func testLoadChannels() {
        if let channels = presenter.channels {
            XCTAssertTrue(!channels.isEmpty)
            XCTAssertTrue(viewMock.isChannelsLoaded)
        } else {
            XCTFail("Error While Loading Data")
        }
    }
    
    func testLoadCategories() {
        if let categoires = presenter.categoires {
            XCTAssertTrue(!categoires.isEmpty)
            XCTAssertTrue(viewMock.isCategoriesLoaded)
        } else {
            XCTFail("Error While Loading Data")
        }
    }
    
}
