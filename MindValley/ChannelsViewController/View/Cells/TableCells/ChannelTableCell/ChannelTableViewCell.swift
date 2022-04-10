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
    
    func configureForEpisodes(media:[EpisodesMedia]?) {
        
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
                                                          media: media, channel: nil,
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

    func configureContent(channel: Channel) {
        categoryImageView.stopShimmering()
        subCategoryLabel.stopShimmering()
        categoryLabel.stopShimmering()
        categoryLabel.backgroundColor = .clear
        subCategoryLabel.backgroundColor = .clear
        
        categoryLabel.text = channel.title
        if !channel.series.isEmpty {
            subCategoryLabel.text = "\(channel.series.count) series"
        } else if !channel.latestMedia.isEmpty {
            subCategoryLabel.text = "\(channel.latestMedia.count) episodes"
        }
        if let url = URL(string: channel.coverAsset.url) {
            categoryImageView.sd_setImage(with: url, completed: nil)
        }
        courseDataSource = CourseCollectionCellDataSource(collectionView: collectionView,
                                                          media: nil, channel: channel,
                                                          completion: { [weak self] in
            guard let self = self else { return }
            let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            self.collectionViewHeight.constant = height
            if !channel.series.isEmpty {
                self.collectionViewHeight.constant = self.collectionView.frame.height / 1.2
            }
            self.setNeedsLayout()
            self.layoutIfNeeded()
            self.collectionView.reloadData()
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
