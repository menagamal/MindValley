//
//  CoursesCollectionViewCell.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var courseSubLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        courseImageView.startShimmering()
        courseTitleLabel.startShimmering()
        courseSubLabel.startShimmering()
    }
}
