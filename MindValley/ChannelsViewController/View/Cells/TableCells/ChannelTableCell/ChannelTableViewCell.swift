//
//  ChannelTableViewCell.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {
    @IBOutlet private weak var categoryImageView: CircularImageView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var subCategoryLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var collectionViewHeight: NSLayoutConstraint!
    private var courseDataSource: CourseCollectionCellDataSource?
    private var categoriesDataSource: CategoryCollectionDataSource?
    
    
    func configureForEpisodes(media:[Media]?) {
        
        categoryImageView.isHidden = true
        categoryLabel.isHidden = true
        categoryImageView.backgroundColor = .clear
        categoryLabel.backgroundColor = .clear
        
        subCategoryLabel.text = "New Episodes"
        subCategoryLabel.font = UIFont(name: "Roboto", size: 20)
        subCategoryLabel.backgroundColor = .clear
        subCategoryLabel.stopShimmering()
        
        self.selectionStyle = .none
        
        courseDataSource = CourseCollectionCellDataSource(collectionView: collectionView,
                                                          media: media,
                                                          completion: { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
                self.collectionViewHeight.constant = height
                self.setNeedsLayout()
                self.layoutIfNeeded()
            }
        })
        
    }
    func configureContent() {
        categoryImageView.startShimmering()
        subCategoryLabel.startShimmering()
        categoryLabel.startShimmering()
        courseDataSource = CourseCollectionCellDataSource(collectionView: collectionView,
                                                          media: nil,
                                                          completion: { [weak self] in
            guard let self = self else { return }
            let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            self.collectionViewHeight.constant = height
            self.setNeedsLayout()
            self.layoutIfNeeded()
        })
        self.selectionStyle = .none
    }
    
    func configureCategories(categories: [Category]?) {
        categoryImageView.isHidden = true
        categoryLabel.isHidden = true
        subCategoryLabel.text = "Browse by categories"
        subCategoryLabel.font = UIFont(name: "Roboto", size: 20)
        subCategoryLabel.backgroundColor = .clear
        subCategoryLabel.stopShimmering()
        subCategoryLabel.stopShimmering()
        categoriesDataSource = CategoryCollectionDataSource(collectionView: collectionView, categories: categories)
        self.selectionStyle = .none
    }
}
