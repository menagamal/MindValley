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
    var categories: [Category]?
    init(collectionView: UICollectionView, categories: [Category]?) {
        self.collectionView = collectionView
        self.categories = categories
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            UINib(nibName: "CategoryCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
        alignedFlowLayout.estimatedItemSize = .init(width: 200, height: 70)
        alignedFlowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = alignedFlowLayout
        self.collectionView.reloadData()
    }
}

extension CategoryCollectionDataSource : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 14
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath ) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(category: categories?[indexPath.row])
        return cell
    }
}
