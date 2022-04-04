//
//  CourseCollectionCellDataSource.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit

class CourseCollectionCellDataSource: NSObject {
    var collectionView: UICollectionView
    var media:[Media]?
    
    init(collectionView: UICollectionView, media:[Media]?, completion:@escaping (()->Void)) {
        self.collectionView = collectionView
        self.media = media
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            UINib(nibName: "CoursesCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CoursesCollectionViewCell")
        self.collectionView.reloadData()
        completion()
    }
}

extension CourseCollectionCellDataSource : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return media?.count ?? 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CoursesCollectionViewCell",
            for: indexPath ) as? CoursesCollectionViewCell else {
                return UICollectionViewCell()
            }
        if let media = media?[indexPath.row] {
            cell.configureWithMedia(media: media)
        } else {
            cell.configureStartShimmering()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: height)
    }
}
