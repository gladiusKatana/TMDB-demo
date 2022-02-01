import Foundation

extension MovieListViewController: MovieListDataSourceDelegate {
    
    func didSelectMovie(_ movie: Movie) {
        
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            return
        }
        
        vc.viewModel.movie = movie                                          ; print("\n\(movie.title)\n")
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

