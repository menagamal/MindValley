//
//  CategoryTableCell.swift
//  MindValley
//
//  Created by Mena Gamal on 10/04/2022.
//

import UIKit

class CategoryTableCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var subCategoryLabel: UILabel!
    
    private var categoriesDataSource: CategoryCollectionDataSource?
    
    func configureCategories(categories: [Category]?) {
        
        subCategoryLabel.text = "Browse by categories"
        subCategoryLabel.backgroundColor = .clear
        subCategoryLabel.stopShimmering()
        
        categoriesDataSource = CategoryCollectionDataSource(collectionView: collectionView, categories: categories)
        self.selectionStyle = .none
    }
    
}
