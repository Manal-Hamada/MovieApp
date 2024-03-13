////
////  DetailsScrExt.swift
////  MovieApp
////
////  Created by JETS Mobile Lab on 25/02/2024.
////
//
//import Foundation
//import UIKit
//import Kingfisher
//
//func degreeToRadiance(deg:CGFloat)->CGFloat{
//    return deg * CGFloat.pi / 180
//}
//extension DetailsScreen {
//
//    func turnCarousel(){
//        guard let transormSubLayers = transformeLayer?.sublayers else{return}
//        let segmantForImageCard = CGFloat(360/transormSubLayers.count)
//        var angleOffeset = currentAngle
//        for layer in transormSubLayers{
//            var transform = CATransform3DIdentity
//            transform.m34 = -1/500
//            transform = CATransform3DRotate(transform, degreeToRadiance(deg: angleOffeset ?? 0.0), 0, 1, 0)
//            transform = CATransform3DTranslate(transform, 0, 0, 200)
//            CATransaction.setAnimationDuration(0)
//            layer.transform = transform
//            angleOffeset! += segmantForImageCard
//        }
//    }
//    func addImageCard(/*imageName:String,*/row:Int){
//        let imageCardSize = CGSize(width: 130, height: 250)
//        let cardLayer = CALayer()
//        cardLayer.frame = CGRect(x: view.frame.width / 2 - imageCardSize.width / 2, y:  view.frame.height / 2 - imageCardSize.height, width: imageCardSize.width, height: imageCardSize.height)
//        cardLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        let poster_path = detailsViewModel?.getAnImage(index: row)?.filePath ?? ""
//        let imgUrl = URL(string: "\(imgHeader)\(poster_path )")
//        var imageCardImage : CGImage?
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: imgUrl!)
//            DispatchQueue.main.async {
//                imageCardImage = UIImage(data: data!)?.cgImage
//                self.transformeLayer?.addSublayer(self.setCardLayer(cardLayer: cardLayer, imageCardImage: imageCardImage))
//            }
//        }
//    }
//    func setCardLayer(cardLayer:CALayer,imageCardImage:CGImage?)->CALayer{
//        cardLayer.contents = imageCardImage
//        cardLayer.contentsGravity = .resizeAspectFill
//        cardLayer.masksToBounds = true
//        cardLayer.isDoubleSided = true
//        cardLayer.borderColor = UIColor(white: 1, alpha: 0.5).cgColor
//        cardLayer.borderWidth = 3
//        cardLayer.cornerRadius = 10
//        return cardLayer
//    }
//    @objc
//    func performPanAction(recognizer:UIPanGestureRecognizer){
//        let xOffeset = recognizer.translation(in: self.view).x
//        if(recognizer.state == .began){
//            currentOffest = 0
//        }
//        let xDiff = xOffeset - currentOffest!
//        currentOffest! += xDiff
//        currentAngle! += xDiff
//        turnCarousel()
//    }
//    
//    func setAllImages(count:Int){
//        var i = 0
//        while(i <= count){
//            addImageCard( row: i)
//            i = i + 5
//        }
//    }
//}
//
