import UIKit; import Foundation

extension MovieListViewController: MenuViewControllerDelegate {
    
    func didSelectListOfMovies(withMovieTypeString movieList: MovieMenuType) {       print("\nmovie type selected: \(movieList)")
        
        if currentMovieList != movieList {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
//            guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {
//                return
//            }
            
            let vc = storyboard.instantiateViewController(identifier: "MovieListViewController", creator: { coder -> MovieListViewController? in
                MovieListViewController(coder: coder, currentMovieList: movieList)
            })
            
            //see below for example code similar to above, from: https://cocoacasts.com/initializer-injection-with-view-controllers-and-storyboards
            
            /*
             let imageViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "ImageViewController", creator: { coder -> ImageViewController? in
             ImageViewController(coder: coder, image: image)
             })
             */
            
            navigationController?.pushViewController(vc, animated: true)
            
            vc.setupNavigationBar(withTitle: movieList.uiTitleString)
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

