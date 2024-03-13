//
//  FlowLayoutHandler.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 18/02/2024.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    
    func setupCollectionView(){
        let itemSize = myCollection.bounds.width / 2
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 20)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        myCollection.collectionViewLayout = layout
                                 
        }
}
