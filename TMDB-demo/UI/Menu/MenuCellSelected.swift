import Foundation; import UIKit

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        //tableView.deselectRow(at: indexPath, animated: true)
        
        
        if indexPath.row == 0 {
            
            dismiss(animated: true) { [weak self] in
                self?.delegate?.didSelectListOfMovies(withMovieTypeString: MovieMenuType.topRated)
            }
        }
        
        else if indexPath.row == 1 {
            
            dismiss(animated: true) { [weak self] in
                self?.delegate?.didSelectListOfMovies(withMovieTypeString: MovieMenuType.nowPlaying)
            }
        }
        
    }
    
}

