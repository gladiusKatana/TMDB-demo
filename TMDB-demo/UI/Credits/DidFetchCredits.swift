import Foundation

extension CreditsViewController: CreditsViewModelDelegate {
    
    func didFetchCredits(_ cast: [Cast], crew: [Crew]) {                            print("\nSTARRING\n")
        //activityIndicator.stopAnimating()
        dataSource.cast = cast
        dataSource.crew = crew
        creditsTableView.isHidden = false
        creditsTableView.reloadData()
        
        for member in cast {
            let noPictureMessage = member.profilePath == nil ? "\n(no picture)" : ""
            print("\(member.name) as \(member.character) \(noPictureMessage)")
        }                                                                           ; print("\nCREW\n")
        
        for member in crew {
            let noPictureMessage = member.profilePath == nil ? "\n(no picture)" : ""
            print("crew member: \(member.name) (\(member.job)) \(noPictureMessage)")
        }
    }
    
}

