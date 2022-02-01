import Foundation; import UIKit

extension MenuViewController {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = indexPath.row == 0 ? "Top Rated Movies" : "Now Playing Movies"
        cell.imageView?.image = UIImage(named: indexPath.row == 0 ? "star-icon" : "movie-reel-icon")
        
        return cell
    }
    
}

