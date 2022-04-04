//
//  ApiManager.swift
//  MindValley
//
//  Created by Mena Gamal on 04/04/2022.
//

import Foundation
import Moya

protocol ApiManagerProtocol {
    var basePresenter: BasePresenterProtocol? { get set}
    var provider: MoyaProvider<ApiTarget>? { get set}
    func request<T:Decodable>(targetType: ApiTarget,completion: @escaping (T) -> Void)
}

class ApiManager: ApiManagerProtocol {
    var basePresenter: BasePresenterProtocol?
    var provider: MoyaProvider<ApiTarget>?
    
    init (basePresenter: BasePresenterProtocol) {
        self.provider = MoyaProvider<ApiTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
        self.basePresenter = basePresenter
    }

    func request<T:Decodable>(targetType: ApiTarget,
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

