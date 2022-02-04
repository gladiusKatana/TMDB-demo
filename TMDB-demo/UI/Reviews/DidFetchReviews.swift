import Foundation

extension ReviewsListViewController: ReviewsListViewModelDelegate {
    
    func didFetchReviews(_ reviews: [Review]) {
        //activityIndicator.stopAnimating()
        dataSource.reviews = reviews
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}

