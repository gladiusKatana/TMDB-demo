import Foundation

extension CreditsDataSource {
    
    func updateNavigationBarTitle(_ indexPath: IndexPath) {
        if indexPath.row >= cast.count + 1 { // change navigation bar title to "Cast & Crew" after 1st crew member shown
            if !firstTimeLoadingFirstCrew {
                firstTimeLoadingFirstCrew = true
            } else {
                if navBarTitle != "Cast & Crew" {
                    navBarTitle = "Cast & Crew"
                    credsVC.setupNavigationBar(withTitle: navBarTitle)
                }
            }
        }
    }
    
}

