////
////  DetailsScreen.swift
////  MovieApp
////
////  Created by JETS Mobile Lab on 12/02/2024.
////
//
//import UIKit
//import CardSlider
//import Kingfisher
//
//class DetailsScreen: UIViewController{
//    
//    @IBOutlet weak var stack_view: UIStackView!
//    
//    var detailsViewModel:DetailsViewModel?
//    var networkManager:NetworkManager?
//    var transformeLayer : CATransformLayer?
//    var currentAngle : CGFloat?
//    var currentOffest : CGFloat?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        networkManager = NetworkManager()
//        detailsViewModel = DetailsViewModel(networkManager: networkManager!)
//        transformeLayer = CATransformLayer()
//        currentAngle  = 0
//        currentOffest = 0
//        addPanGesture()
//        detailsViewModel?.loadImages(movie: 671)
//        detailsViewModel?.bindImagesToViewControllers = {[weak self] in
//            DispatchQueue.main.async {
//                //self?.addPanGesture()
//                self?.setAllImages(count:40)
//                self?.turnCarousel()
//            }
//        }
//    }
//    func addPanGesture(){
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DetailsScreen().performPanAction(recognizer:)))
//        self.view.addGestureRecognizer(panGestureRecognizer)
//        transformeLayer?.frame = self.view.bounds
//        view.layer.addSublayer(transformeLayer!)
//    }
//}
//
////class DetailsScreen: UIViewController , CardSliderDataSource {
////
////    var detailsViewModel:DetailsViewModel?
////    var networkManager:NetworkManager?
////    var cardData:[CardSliderItem] = []
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        networkManager = NetworkManager()
////        detailsViewModel = DetailsViewModel(networkManager: networkManager!)
////        cardData = [CardItem(image:UIImage(named: "africano") ?? UIImage(), title: "Movie")]
////        setCardData(images: self.detailsViewModel?.getImages() ?? [] )
////        setCardsAppearence()
////        }
////
////    func numberOfItems() -> Int {
////        return detailsViewModel?.getImagesCount() ?? 0
////    }
////    func item(for index: Int) -> CardSlider.CardSliderItem {
////        return cardData[0] //cardData[index]
////    }
////
////    func setCardData (images : [Image]){
////        var i = 0
////        while(images.count > 0){
////            let imgUrl = URL(string: "\(imgHeader)\(images[i].filePath )")
////            let img : UIImageView = UIImageView()
////            cardData.append(CardItem(image: img.image ?? UIImage(), title: "Movie"))
////            img.kf.setImage(with: imgUrl,placeholder:UIImage(named: "movie_placeholder"))
////            i = i+1
////        }
////
////    }
////    func setCardsAppearence(){
////        let vc = CardSliderViewController.with(dataSource: self)
////        vc.title = "Welcome"
////        vc.modalPresentationStyle = .popover
////        present(vc, animated: true)
////    }
////
////}
