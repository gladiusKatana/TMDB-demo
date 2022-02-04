import Foundation




//struct ReviewsResponseObject: Decodable {     // already declared in MovieDetailService.swift; included here for aesthetic/context reasons
//    let results: [Review]
//}

protocol ReviewsListServiceProtocol {
    
    func fetchReviews(for movieId: Int, completion: @escaping (Result<ReviewsResponseObject>) -> Void)
}

class ReviewsListService: APIClient {
    var session: URLSession
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
}

extension ReviewsListService: ReviewsListServiceProtocol {
    func fetchReviews(for movieId: Int, completion: @escaping (Result<ReviewsResponseObject>) -> Void) {
        guard let url = URL(string: Constants.baseURL + "movie/\(movieId)/reviews") else {
            completion(.failure)
            return
        }
        let request = URLRequest(url: url)
        fetch(with: request, decode: { $0 as? ReviewsResponseObject ?? nil }, completion: completion)
    }
}

