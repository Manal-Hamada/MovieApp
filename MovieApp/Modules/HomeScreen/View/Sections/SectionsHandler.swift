//
//  SectionsHandler.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 18/02/2024.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func setItem(width:CGFloat,height:CGFloat)->NSCollectionLayoutItem{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width), heightDimension: .absolute(height))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    func setScrollingDirection(direction:String) ->Bool{
        switch (direction){
        case "h" :
            return true
        default :
            return false
        }
    }
    
    func setGroup(width:CGFloat,height:CGFloat,item:NSCollectionLayoutItem,direction:String)->NSCollectionLayoutGroup{
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width), heightDimension: .absolute(height))
        if(setScrollingDirection(direction: direction)){
            return NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        }
        return NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    }
    
    func setHeader(width:CGFloat,height:CGFloat)->NSCollectionLayoutBoundarySupplementaryItem{
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width), heightDimension: .absolute(height))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    func setSection(group:NSCollectionLayoutGroup,headerSupplementary:NSCollectionLayoutBoundarySupplementaryItem)->NSCollectionLayoutSection{
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerSupplementary]
        return section
    }
    
    func drawTopSection() -> NSCollectionLayoutSection{
        let group = setGroup(width: 1, height: 250, item: setItem(width: 0.5, height: 250), direction: "h")
        let section = setSection(group: group, headerSupplementary:setHeader(width: 1.0, height: 45))
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    func drawPopularSection() -> NSCollectionLayoutSection{
        let group = setGroup(width: 1, height:100 , item: setItem(width: 0.5, height: 110), direction: "h")
        let section = setSection(group: group, headerSupplementary:setHeader(width: 1.0, height: 45))
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    func drawUpcomingSection() -> NSCollectionLayoutSection{
        let group = setGroup(width: 1, height:100 , item: setItem(width: 0.33, height: 110), direction: "h")
        let section = setSection(group: group, headerSupplementary:setHeader(width: 1.0, height: 45))
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    func drawNowPlayingSection() -> NSCollectionLayoutSection{
        let group = setGroup(width: 1, height:150 , item: setItem(width: 0.5, height: 150), direction: "h")
        let section = setSection(group: group, headerSupplementary:setHeader(width: 1.0, height: 45))
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let  sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "movie_type_header", for: indexPath) as? Headers
        if kind == UICollectionView.elementKindSectionHeader {
            
            switch(indexPath.section){
            case 0:
                sectionHeader!.sectionHeader.text = "Top Rated"
            case 1:
                sectionHeader!.sectionHeader.text = "Popular"
            case 2:
                sectionHeader!.sectionHeader.text = "Up Coming"
            default:
                sectionHeader!.sectionHeader.text = "Now Playing"
                
            }
        }
        return sectionHeader!
    }
    
    func setLayout(){
        let layout = UICollectionViewCompositionalLayout{index, environment in
            switch index{
            case 0 :
                return self.drawTopSection()
            case 1 :
                return self.drawPopularSection()
            case 2 :
                return self.drawUpcomingSection()
            default:
                return self.drawNowPlayingSection()
            }
        }
        
        myCollection.setCollectionViewLayout(layout, animated: true)
        
    }
    
}
