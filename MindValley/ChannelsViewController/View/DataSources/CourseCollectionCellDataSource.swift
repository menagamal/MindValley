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
    init(collectionView: UICollectionView, completion:@escaping (()->Void)) {
        self.collectionView = collectionView
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
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CoursesCollectionViewCell",
            for: indexPath ) as? CoursesCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: height)
    }
}
