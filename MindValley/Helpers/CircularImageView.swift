//
//  CircularImageView.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit

class CircularImageView: UIImageView {
    
    override func didMoveToWindow() {
        
        let size = frame.size.width
        self.layer.cornerRadius = size / 2
        clipsToBounds = true
        
        super.didMoveToWindow()
    }
}

