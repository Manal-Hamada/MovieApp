import UIKit
import Kingfisher


class SearchScreen: UIViewController,UICollectionViewDelegate, UISearchBarDelegate{
    @IBOutlet weak var myCollectionview: UICollectionView!
    
    @IBOutlet weak var search_indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchViewModel:SearchViewModel?
    var networkManager:NetworkProtocol?
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupCollectionView()
        networkManager = NetworkManager()
        searchViewModel = SearchViewModel(networkManger: networkManager)
        self.navigationController?.navigationBar.isHidden = false
        myCollectionview.reloadData()
        searchBar.text = name
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        name = searchText.replacingOccurrences(of: " ", with: "+")
        if((name?.count ?? 0) % 2 == 0){
            search_indicator.startAnimating()
            searchViewModel?.searchByName(movieName:name ?? "" )
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
