//
//  ApiManager.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//

import Foundation
import Moya

protocol ApiManagerProtocol {
    func fetchChannelsFromServer(completion: @escaping (ChannelsResponse) -> Void)
    func fetchCategoriesFromServer(completion: @escaping (CategoriesResponse) -> Void)
    func fetchEpisodesFromServer(completion: @escaping (EpisodesResponse) -> Void) 
}

class ApiManager: ApiManagerProtocol {
    private var basePresenter: BasePresenterProtocol?
    private var provider: MoyaProvider<ApiTarget>?
    
    init (basePresenter: BasePresenterProtocol) {
        self.provider = MoyaProvider<ApiTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
        self.basePresenter = basePresenter
    }

    func fetchChannelsFromServer(completion: @escaping (ChannelsResponse) -> Void) {
        request(targetType: .fetchChannels, completion: completion)
    }
    
    func fetchCategoriesFromServer(completion: @escaping (CategoriesResponse) -> Void) {
        request(targetType: .fetchCategories, completion: completion)
    }
    
    
    func fetchEpisodesFromServer(completion: @escaping (EpisodesResponse) -> Void) {
        request(targetType: .fetchEpisodes, completion: completion)
    }

    private func request<T:Decodable>(targetType: ApiTarget,
                              completion: @escaping (T) -> Void) {
        provider?.request(targetType.debugLog()) { result in
            switch(result) {
            case .success(let response):
                do {
                    let decodableResponse = try response.debugLog().map(T.self)
                    completion(decodableResponse)
                }
                catch {
                    print(error)
                    self.basePresenter?.present(message: error.localizedDescription)
                }
            case .failure(let error):
                print(error)
                self.basePresenter?.present(message: error.localizedDescription)
            }
        }
    }
}

extension TargetType {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        print("Base Url =============", baseURL)
        print("Path =================", path)
        print("URL ==================", baseURL,path)
        print("HTTP Method ==========", method.rawValue)
        print("Task =================", task)
        print("Headers ==============", headers ?? "No Headers")
        debugPrint("=======================================")
        #endif
        return self
    }
}

extension Response {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint(String(data: self.data, encoding: .utf8) ?? "ERRRO")
        debugPrint("=======================================")
        #endif
        return self
    }
}

