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
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .fetchEpisodes:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case.fetchEpisodes :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
