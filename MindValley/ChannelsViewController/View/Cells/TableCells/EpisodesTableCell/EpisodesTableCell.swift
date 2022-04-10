//
//  EpisodesTableCell.swift
//  MindValley
//
//  Created by Mena Gamal on 10/04/2022.
//

import UIKit

class EpisodesTableCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var subCategoryLabel: UILabel!
    @IBOutlet private weak var collectionViewHeight: NSLayoutConstraint!
    
    private var courseDataSource: CourseCollectionCellDataSource?
    
    func configureForEpisodes(media:[EpisodesMedia]?) {
     
        subCategoryLabel.text = "New Episodes"
        subCategoryLabel.backgroundColor = .clear
        subCategoryLabel.stopShimmering()
        self.selectionStyle = .none
        
        courseDataSource = CourseCollectionCellDataSource(collectionView: collectionView,
                                                          media: media,
                                                          channel: nil,
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

}
