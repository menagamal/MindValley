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
        courseImageView.layer.cornerRadius = 10
    }

    func configureStartShimmering() {
        courseImageView.startShimmering()
        courseTitleLabel.startShimmering()
        courseSubLabel.startShimmering()
    }
    
    func configureWithMedia(media: EpisodesMedia){
        DispatchQueue.main.async {
            self.courseImageView.stopShimmering()
            self.courseTitleLabel.stopShimmering()
            self.courseSubLabel.stopShimmering()
            self.courseTitleLabel.backgroundColor = .clear
            self.courseSubLabel.backgroundColor = .clear
        }
        courseTitleLabel.text = media.title
        courseSubLabel.text = media.channel.title
        if let url = URL(string: media.coverAsset.url) {
            courseImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    func configureWithSeries(series: Series){
        DispatchQueue.main.async {
            self.courseImageView.stopShimmering()
            self.courseTitleLabel.stopShimmering()
            self.courseSubLabel.stopShimmering()
            self.courseTitleLabel.backgroundColor = .clear
            self.courseSubLabel.backgroundColor = .clear
        }
        
        courseTitleLabel.text = series.title
        courseSubLabel.isHidden = true
        if let url = URL(string: series.coverAsset.url) {
            courseImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    func configureWithLatestMedia(media: LatestMedia){
        DispatchQueue.main.async {
            self.courseImageView.stopShimmering()
            self.courseTitleLabel.stopShimmering()
            self.courseSubLabel.stopShimmering()
            self.courseTitleLabel.backgroundColor = .clear
            self.courseSubLabel.backgroundColor = .clear
        }
        
        courseTitleLabel.text = media.title
        courseSubLabel.isHidden = true
        if let url = URL(string: media.coverAsset.url) {
            courseImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
}
