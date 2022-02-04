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
    
    func serviceFetchReviews(usingMockData: Bool) {
        
        if usingMockData {
            if let reviews = loadJson(filename: "MockReviews") {
                print("people: \(reviews.map{ $0.author })")
                self.delegate?.didFetchReviews(reviews)
            }
        }
        else {
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
        
        func loadJson(filename fileName: String) -> [Review]? {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let jsonData = try decoder.decode(ReviewsResponseObject.self, from: data)
                    return jsonData.results
                } catch {
                    print("loadJson(:) error:\(error)")
                }
            }
            return nil
        }
        
    }
}

