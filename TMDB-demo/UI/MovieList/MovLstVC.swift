import Foundation; import UIKit; import SideMenu

class MovieListViewController: UIViewController, ActivityIndicatorContainer {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /*private*/ lazy var dataSource = MovieListDataSource(delegate: self)
    /*private*/ let viewModel = MovieListViewModel()
    /*private*/ let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieListUI()
        setupSideMenu()
        viewModel.bind(to: self)
        updateMoviesListUIAndFetch()
    }
    
    /*private*/ func updateMoviesListUIAndFetch() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
        viewModel.serviceFetchMovies(withMovieTypeString: globalMovieTypeString)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        guard let vc = SideMenuManager.default.menuLeftNavigationController else {
            return
        }
        present(vc, animated: true)
    }
    
}

