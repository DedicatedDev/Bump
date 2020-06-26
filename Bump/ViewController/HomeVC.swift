//
//  HomeVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit
import Gemini

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: GeminiCollectionView! {
       didSet {
           collectionView.delegate   = self
           collectionView.dataSource = self

           if #available(iOS 11.0, *) {
               collectionView.contentInsetAdjustmentBehavior = .never
           }

           collectionView.gemini
               .scaleAnimation()
               .scale(0.75)
               .scaleEffect(scaleEffect)
               .ease(.easeOutQuart)
        
       }
   }

   private let cellIdentifier = String(describing: ImageCollectionViewCell.self)
   private var scrollDirection = UICollectionView.ScrollDirection.vertical
   private var scaleEffect = GeminScaleEffect.scaleUp
   private let images = [#imageLiteral(resourceName: "Rectangle Copy 5-1"), #imageLiteral(resourceName: "Rectangle Copy 51"), #imageLiteral(resourceName: "Rectangle Copy 52"), #imageLiteral(resourceName: "Rectangle Copy 53")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewPagingFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    
    
}



// MARK: - UIScrollViewDelegate

extension HomeVC {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.animateVisibleCells()
    }
}

// MARK: - UICollectionViewDelegate

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? GeminiCell {
            self.collectionView.animateCell(cell)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.configure(with: images[indexPath.row])
        self.collectionView.animateCell(cell)
        return cell
    }
}

extension UIDevice {
    var hasTopNotch: Bool {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
    }
}
