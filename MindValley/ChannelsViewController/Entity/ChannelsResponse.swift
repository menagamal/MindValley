//
//  ChannelsResponse.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//

import Foundation

// MARK: - ChannelsResponse
struct ChannelsResponse: Codable {
    let data: ChannelsDataClass
    init () {
        data = ChannelsDataClass()
    }
}

// MARK: - DataClass
struct ChannelsDataClass: Codable {
    let channels: [Channel]
    init () {
        channels = [Channel()]
    }
}

// MARK: - Channel
struct Channel: Codable {
    let title: String
    let series: [Series]
    let mediaCount: Int
    let latestMedia: [LatestMedia]
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset
    let slug: String?
    init() {
        title = ""
        series = [Series]()
        mediaCount = 1
        latestMedia = [LatestMedia]()
        id = ""
        iconAsset = nil
        slug = nil
        coverAsset = CoverAsset()
    }
}

// MARK: - IconAsset
struct IconAsset: Codable {
    let thumbnailURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct LatestMedia: Codable {
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset
    init() {
        type = .course
        title = ""
        coverAsset = CoverAsset()
    }
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable {
    let title: String
    let coverAsset: CoverAsset
    let id: String?
    init() {
        title = ""
        coverAsset = CoverAsset()
        id = ""
    }
}
