//
//  CategoriesResponse.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//

import Foundation
// MARK: - CategoriesResponse
struct CategoriesResponse: Codable {
    let data: CategoriesDataClass
}

// MARK: - DataClass
struct CategoriesDataClass: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let name: String
}
