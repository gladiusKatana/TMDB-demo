import Foundation

extension ReviewsListViewController: ReviewsListDataSourceDelegate {
    
    func didSelectReview(_ review: Review) {
        
        
        print("\n\n\nSelected review by \(review.id)\n\n\n")
        
        
    }
    
}

