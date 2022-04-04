//
//  EpisodesResponse.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//
import Foundation

// MARK: - EpisodesResponse
struct EpisodesResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let media: [Media]
}

// MARK: - Media
struct Media: Codable {
    let type, title: String
    let coverAsset: CoverAsset
    let channel: Channel
}

// MARK: - Channel
struct Channel: Codable {
    let title: String
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String
}
