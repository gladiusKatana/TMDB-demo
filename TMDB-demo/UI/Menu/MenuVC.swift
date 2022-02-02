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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = indexPath.row == 0 ? "Top Rated Movies" : "Now Playing Movies"
        cell.imageView?.image = UIImage(named: indexPath.row == 0 ? "star-icon" : "movie-reel-icon")
        
        return cell
    }
    
    private func setupMenuUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

