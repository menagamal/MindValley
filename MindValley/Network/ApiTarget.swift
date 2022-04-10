//
//  ApiTarget.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//
//https://pastebin.com/raw/z5AExTtw
//Xt12uVhM
//https://pastebin.com/raw/A0CgArX3
import Foundation
import Moya

enum ApiTarget  {
    case fetchEpisodes
    case fetchCategories
    case fetchChannels
}

extension ApiTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://pastebin.com/raw/") else {
            preconditionFailure("Invalid url")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case.fetchEpisodes:
            return "z5AExTtw"
        case .fetchCategories :
            return "A0CgArX3"
        case .fetchChannels:
            return "Xt12uVhM" 
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .fetchEpisodes,.fetchCategories, .fetchChannels:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case.fetchEpisodes ,.fetchCategories, .fetchChannels:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
