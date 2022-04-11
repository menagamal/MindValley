//
//  EpisodesResponse.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//
import Foundation

// MARK: - EpisodesResponse
class EpisodesResponse: Codable {
    let data: DataClass
    init () {
        data = DataClass()
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let media: [EpisodesMedia]
    init () {
        media = [EpisodesMedia()]
    }
}

// MARK: - Media
struct EpisodesMedia: Codable {
    let type, title: String
    let coverAsset: CoverAsset
    let channel: Episode
    init(){
        type = ""
        title = ""
        coverAsset = CoverAsset()
        channel = Episode()
    }
}

// MARK: - Channel
struct Episode: Codable {
    let title: String
    init() {
        title  = ""
    }
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String
    init() {
        url = ""
    }
}
