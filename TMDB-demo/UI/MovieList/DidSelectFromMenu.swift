import UIKit; import Foundation

extension MovieListViewController: MenuViewControllerDelegate {
    
    func didSelectListOfMovies(withMovieTypeString movieTypeString: String) {       print("movie type selected: \(movieTypeString)")
        
//        if navigationController?.viewControllers.last != self {
//            navigationController?.popToRootViewController(animated: true)
//        }
//        updateMoviesListUIAndFetch()
        
        if globalMovieTypeString != movieTypeString {
            globalMovieTypeString = movieTypeString
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {
                return
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
            switch movieTypeString {
            case "now_playing": vc.setupNavigationBar(withTitle: "Now Playing Movies")
            case "top_rated": vc.setupNavigationBar(withTitle: "Top Rated Movies")
            default: break
            }
        }
    }
    
//    func didSelectNowPlayingMovies() { print("selected now playing movies from menu")  /// do not need this currently as handling logic via...
//    }
    
}

