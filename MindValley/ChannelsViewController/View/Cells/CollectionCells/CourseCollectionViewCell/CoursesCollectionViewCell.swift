//
//  CoursesCollectionViewCell.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit
import SDWebImage

class CoursesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var courseSubLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureStartShimmering() {
        courseImageView.startShimmering()
        courseTitleLabel.startShimmering()
        courseSubLabel.startShimmering()
    }
    
    func configureWithMedia(media: Media){
        courseImageView.stopShimmering()
        courseTitleLabel.stopShimmering()
        courseSubLabel.stopShimmering()
        
        courseTitleLabel.backgroundColor = .clear
        courseSubLabel.backgroundColor = .clear
        
        courseTitleLabel.text = media.title
        courseSubLabel.text = media.channel.title
        if let url = URL(string: media.coverAsset.url) {
            courseImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
}
