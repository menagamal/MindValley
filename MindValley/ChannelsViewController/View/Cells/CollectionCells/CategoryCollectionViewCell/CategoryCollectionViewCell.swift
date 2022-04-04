//
//  CategoryCollectionViewCell.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var labelCategoryTitle: UILabel!
    @IBOutlet private weak var categoryContainerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 3.7
    }

    func configure(category:Category?) {
        if let category = category {
            categoryContainerView.stopShimmering()
            labelCategoryTitle.isHidden = false
            labelCategoryTitle.text = category.name
        } else {
            categoryContainerView.startShimmering()
            labelCategoryTitle.isHidden = false
        }
        
    }
}
