//
//  CategoryCollectionDataSource.swift
//  MindValley
//
//  Created by Mena Gamal on 03/04/2022.
//

import Foundation
import UIKit
import AlignedCollectionViewFlowLayout
class CategoryCollectionDataSource: NSObject {
    var collectionView: UICollectionView
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            UINib(nibName: "CategoryCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
        alignedFlowLayout.estimatedItemSize = .init(width: 100, height: 40)
        alignedFlowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = alignedFlowLayout
        self.collectionView.reloadData()
    }
}

extension CategoryCollectionDataSource : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath ) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure()
        return cell
    }
}
