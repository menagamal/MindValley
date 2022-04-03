//
//  BasePresenter.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation

protocol BasePresenterProtocol {
    func present(message: String)
}
class BasePresenter {
    weak var baseView: BaseViewProtocol?
}

extension BasePresenter: BasePresenterProtocol {
    
    func present(message: String) {
        baseView?.display(message: message)
    }
}

