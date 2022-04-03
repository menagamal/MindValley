//
//  BaseViewController.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

protocol BaseViewProtocol: AnyObject {
    func display(message: String)
}
class BaseViewController: UIViewController, BaseViewProtocol {
    func display(message: String) {
        DispatchQueue.main.async {
            var alert = UIAlertController()
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
    }
}
