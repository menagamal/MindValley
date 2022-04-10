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
    var media:[EpisodesMedia]?
    var channel:Channel?
    
    init(collectionView: UICollectionView, media:[EpisodesMedia]?, channel:Channel?, completion:@escaping (()->Void)) {
        self.collectionView = collectionView
        self.media = media
        self.channel = channel
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
        if let channel = channel {
            if !channel.series.isEmpty {
                return channel.series.count
            } else if !channel.latestMedia.isEmpty  {
                return channel.latestMedia.count
            } else {
                return 0
            }
        }
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
        } else if let channel = channel {
            if !channel.series.isEmpty {
                let series = channel.series[indexPath.row]
                cell.configureWithSeries(series: series)
            } else if !channel.latestMedia.isEmpty {
                let latestMedia = channel.latestMedia[indexPath.row]
                cell.configureWithLatestMedia(media: latestMedia)
            }
        } else {
            cell.configureStartShimmering()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let channel = channel {
            if !channel.series.isEmpty {
                let height = collectionView.frame.height / 1.4
                let width = collectionView.frame.width / 1.2
                return CGSize(width: width, height: height)
            }
        }
        let height = collectionView.frame.height
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: height)
    }
}
