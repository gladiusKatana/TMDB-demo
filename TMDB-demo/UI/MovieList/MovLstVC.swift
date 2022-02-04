import Foundation; import UIKit; import SideMenu

class MovieListViewController: UIViewController, ActivityIndicatorContainer {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MovieListViewModel()
    lazy var dataSource = MovieListDataSource(delegate: self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    var currentMovieList = MovieMenuType.topRated
    
    
    convenience init?(coder: NSCoder, currentMovieList: MovieMenuType) {
        self.init(coder: coder)
        self.currentMovieList = currentMovieList
    }
    //    * use below 2 inits (/**/) instead of the convenience init above, and see what happens!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieListUI()
        setupSideMenu()
        viewModel.bind(to: self)
        updateMoviesListUIAndFetch(withMovieTypeString: currentMovieList.apiString)
    }
    
    
    func updateMoviesListUIAndFetch(withMovieTypeString movieTypeString: String) {
        activityIndicator.startAnimating()
        tableView.isHidden = true
        viewModel.serviceFetchMovies(withMovieTypeString: movieTypeString)
    }
    
    
    func setupMovieListUI() {
        title = currentMovieList.uiTitleString
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "MovieListCell") /// use a protocol rather than hardcoding
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        guard let vc = SideMenuManager.default.menuLeftNavigationController else {
            return
        }
        present(vc, animated: true)
    }
    
    
    /*
    convenience init?(coder: NSCoder, currentMovieList: MovieMenuType) {
        self.init(coder: coder)
        self.currentMovieList = currentMovieList
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     */
}

