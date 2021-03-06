//
//  ChannelsBuilder.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

class ChannelsBuilder {
    func instantiate() -> UIViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let view = storyboard.instantiateInitialViewController() as? ChannelsViewController {
            let interactor: ChannelsInteractor = ChannelsInteractor()
            let router: ChannelsRouter = ChannelsRouter()
            
            let presenter: ChannelsPresenter = ChannelsPresenter(view: view, interactor: interactor, router: router)
            
            router.view = view
            view.presenter = presenter
            interactor.presenter = presenter
            presenter.baseView = view
            
            let network = ApiManager(basePresenter: presenter)
            interactor.network = network
            interactor.cacheManager = CachingManager()
            return view
        }
      
        return UIViewController()
    }
}
