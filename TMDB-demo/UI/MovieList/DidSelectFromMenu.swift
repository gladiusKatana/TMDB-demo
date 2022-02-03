import UIKit; import Foundation

extension MovieListViewController: MenuViewControllerDelegate {
    
    func didSelectListOfMovies(withMovieTypeString movieTypeString: MovieMenuType) {       print("movie type selected: \(movieTypeString)")
        
        if globalMovieType != movieTypeString {
            globalMovieType = movieTypeString
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {
                return
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
            vc.setupNavigationBar(withTitle: movieTypeString.uiTitleString)
        }
        
        // alternative navigation approach ... not ideal as large-font navigation bar title will not display title dynamically when switching views ...
        // ... see func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
        /*
        //print("\(navigationController?.viewControllers.count ?? -1) view controller(s) in the navigation stack")
        if navigationController?.viewControllers.last != self {
            navigationController?.pushViewController(self, animated: true)  // or: navigationController?.popToRootViewController(animated: false)
        }
        updateMoviesListUIAndFetch(withMovieTypeString: movieTypeString)
        */
    }
    
//    func didSelectNowPlayingMovies() { print("selected now playing movies from menu")  /// do not need this currently as handling logic via...
//    }
    
}

