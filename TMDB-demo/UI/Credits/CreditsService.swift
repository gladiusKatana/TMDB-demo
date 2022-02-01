import Foundation

struct CreditsResponseObject: Decodable {
    let cast: [Cast]
    let crew: [Crew]
}



protocol CreditsServiceProtocol {
    func fetchCredits(for movieId: Int, completion: @escaping (Result<CreditsResponseObject>) -> Void)
}


class CreditsService: APIClient {
    var session: URLSession
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
}

extension CreditsService: CreditsServiceProtocol { ///TODO: fetch credits from the movie's credits endpoint, for details see: tinyurl.com/y62uv25c
    func fetchCredits(for movieId: Int, completion: @escaping (Result<CreditsResponseObject>) -> Void) {
        guard let url = URL(string: Constants.baseURL + "movie/\(movieId)/credits") else {
            completion(.failure)
            return
        }
        let request = URLRequest(url: url)
        fetch(with: request, decode: { $0 as? CreditsResponseObject ?? nil }, completion: completion)
    }
}

