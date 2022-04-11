//
//  ViewMock.swift
//  MindValleyTests
//
//  Created by Mena Gamal on 11/04/2022.
//

import Foundation
import UIKit
@testable import MindValley
class ViewMock: ChannelsViewProtocol {
    var presenter: ChannelsPresenterProtocol?
    var isEpisodesLoaded = false
    var isCategoriesLoaded = false
    var isChannelsLoaded = false
    
    func didLoadEpisodes() {
        isEpisodesLoaded = true
    }
    
    func didLoadCategories() {
        isCategoriesLoaded = true
    }
    
    func didLoadChannels() {
        isChannelsLoaded = true
    }
    
    
}
