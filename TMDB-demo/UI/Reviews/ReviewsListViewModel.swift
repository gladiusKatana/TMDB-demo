import Foundation

protocol ReviewsListViewModelDelegate: ErrorReceivableDelegate {
    
    func didFetchReviews(_ reviews: [Review])
}

class ReviewsListViewModel {
    
    private let service: ReviewsListServiceProtocol
    private weak var delegate: ReviewsListViewModelDelegate?
    
    var movie: Movie!
    
    init(service: ReviewsListServiceProtocol = ReviewsListService()) {
        self.service = service
    }
    
    func bind(to delegate: ReviewsListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func serviceFetchReviews() {
        service.fetchReviews(for: movie.id) { [weak self] (result) in
            switch result {
            case .success(let reviewsResponseObject):
                let reviews = reviewsResponseObject.results
                self?.delegate?.didFetchReviews(reviews)
            case .failure:
                self?.delegate?.didReceiveError("Failed to get reviews")
            }
        }
    }
}

