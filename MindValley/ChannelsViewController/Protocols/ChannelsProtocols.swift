//
//  ChannelsProtocols.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

//MARK: View -
protocol ChannelsViewProtocol: AnyObject {
    var presenter: ChannelsPresenterProtocol?  { get set }
}
//MARK: Presenter -
protocol ChannelsPresenterProtocol: AnyObject {
    var view: ChannelsViewProtocol?  { get set }
}

//MARK: Interactor -
protocol ChannelsInteractorOutputProtocol: AnyObject {
}
protocol ChannelsInteractorInputProtocol: AnyObject {
    var presenter: ChannelsInteractorOutputProtocol?  { get set }
}

//MARK: Router -
protocol ChannelsRouterProtocol: AnyObject {
    var view: UIViewController! { get set }
}
