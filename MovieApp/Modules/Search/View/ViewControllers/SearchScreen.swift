import UIKit
import Kingfisher


class SearchScreen: UIViewController,UICollectionViewDelegate, UISearchBarDelegate{
    @IBOutlet weak var myCollectionview: UICollectionView!
    
    @IBOutlet weak var search_indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // @IBOutlet weak var segmantsCollectionView: UICollectionView!
    var searchViewModel:SearchViewModel?
    var networkManager:NetworkProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupCollectionView()
        networkManager = NetworkManager()
        searchViewModel = SearchViewModel(networkManger: networkManager)
        myCollectionview.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let name = searchText.replacingOccurrences(of: " ", with: "+")
        if(name.count % 2 == 0){
            search_indicator.startAnimating()
            searchViewModel?.searchByName(movieName:name )
            searchViewModel?.bindSearchResultToViewController = { [weak self] in
                DispatchQueue.main.async {
                    self?.search_indicator.stopAnimating()
                    self?.myCollectionview.reloadData()
                    
                }
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
