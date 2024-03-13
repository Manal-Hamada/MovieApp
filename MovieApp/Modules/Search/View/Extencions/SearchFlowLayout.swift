import Foundation
import UIKit

extension SearchScreen : UICollectionViewDelegateFlowLayout{
    
    func setupCollectionView(){
        let layout = createItemSize(numOfItems: 2,collectionView: myCollectionview,deduction: 5)
        //        let segmantLayout = createItemSize(numOfItems: 4,collectionView: segmantsCollectionView,deduction: 0)
        //        segmantLayout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        myCollectionview.collectionViewLayout = layout
        
    }
    
    func createItemSize(numOfItems:Double,collectionView:UICollectionView,deduction:Int) ->UICollectionViewFlowLayout{
        
        let itemSize = collectionView.bounds.width / numOfItems
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if (collectionView == myCollectionview){
            layout.itemSize = CGSize(width: (itemSize - Double(deduction)), height: itemSize)
        }
        else {
            // layout.itemSize = CGSize(width: (itemSize - Double(deduction)), height: 30)
        }
        return layout
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//                if (collectionView == segmantsCollectionView){
//                    return CGSize(width: (searchViewModel?.getAGenre(index: indexPath.item).name?.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width ?? 0) + 10, height: 30)
//
//                }
//        let w = myCollectionview.bounds.width / 2
//        return CGSize(width: w - 10, height: w)
//    }
}

