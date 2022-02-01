import Foundation

protocol CreditsViewModelDelegate: ErrorReceivableDelegate {
    func didFetchCredits(_ cast: [Cast], crew: [Crew])
}


class CreditsViewModel {
    
    private let service: CreditsServiceProtocol
    private weak var delegate: CreditsViewModelDelegate?
    
    var movie: Movie!
    
    init(service: CreditsServiceProtocol = CreditsService()) {
        self.service = service
    }
    
    func bind(to delegate: CreditsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func serviceFetchCredits() {
        service.fetchCredits(for: movie.id) { [weak self] (result) in
            switch result {
            case .success(let creditsLists):
                let (cast,crew) = (creditsLists.cast,creditsLists.crew)
                self?.delegate?.didFetchCredits(cast,crew: crew)
            case .failure:
                self?.delegate?.didReceiveError("Failed to get credits")
            }
        }
    }
}

