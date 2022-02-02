import UIKit

var credsVC = CreditsViewController() /// storyboard-instantiated credits-view controller instance, for calling setupNavigationBar(:), ie updating it

extension CreditsDataSource {
    
    func updateNavigationBarTitle(_ indexPath: IndexPath) {
        
        if indexPath.row >= cast.count + 1 { // change navigation bar title to "Cast & Crew" after 1st crew member shown
            
            //print("\n\n CAST+CREW index path row \(indexPath.row)\n\n")
            
            let str = "Cast & Crew"
            
            credsVC.setupNavigationBar(withTitle: str)
            
        } else {
            
            //print("\n\nCAST index path row \(indexPath.row)\n\n")
            
            credsVC.setupNavigationBar(withTitle: "Cast")
        }
    }
    
}

