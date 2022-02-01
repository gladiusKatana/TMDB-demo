import Foundation

extension MovieListViewController: MovieListViewModelDelegate {
    
    func didFetchMovies(_ movies: [Movie]) {
        activityIndicator.stopAnimating()
        dataSource.movies = movies
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}

