import Foundation; import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelectListOfMovies(withMovieTypeString: String)
    //func didSelectNowPlayingMovies()
}

class MenuViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: MenuViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuUI()
    }
    
    
    private func setupMenuUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

