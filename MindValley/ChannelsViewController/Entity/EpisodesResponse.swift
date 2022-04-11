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
}

// MARK: - DataClass
struct DataClass: Codable {
    let media: [EpisodesMedia]
}

// MARK: - Media
struct EpisodesMedia: Codable {
    let type, title: String
    let coverAsset: CoverAsset
    let channel: Episode
}

// MARK: - Channel
struct Episode: Codable {
    let title: String
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String
}
