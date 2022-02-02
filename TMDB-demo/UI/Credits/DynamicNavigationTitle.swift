import UIKit

extension CreditsDataSource {
    
    func updateNavigationBarTitle(_ indexPath: IndexPath) {
        
        if indexPath.row >= cast.count + 1 { // change navigation bar title to "Cast & Crew" after 1st crew member shown
            
            if !firstTimeLoadingFirstCrew {
                firstTimeLoadingFirstCrew = true
            }
            else {
                let str = "Cast & Crew"
                if navBarTitle != str {
                    navBarTitle = str
                    let vc = UIViewController()
                    vc.setupNavigationBar(withTitle: navBarTitle)
                }
            }
        }
    }
    
}

