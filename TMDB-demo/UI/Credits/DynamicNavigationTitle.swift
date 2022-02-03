import UIKit

extension CreditsDataSource {
    
    func updateNavigationBarTitle(_ indexPath: IndexPath) {
        
        let credsVC = delegatedViewController /// storyboard-instantiated credits-view controller that owns this data source instance
        
        var str = ""
        
        if indexPath.row >= cast.count + 1 { // change navigation bar title to "Cast & Crew" after 1st crew member shown
            
                //print("\n\n CAST+CREW index path row \(indexPath.row)\n\n")
            
            str = "Cast & Crew"
            
        } else {
            
                //print("\n\nCAST index path row \(indexPath.row)\n\n")
            
            str = "Cast"
            
        }
        
        credsVC?.setupNavigationBar(withTitle: str)
    }
    
}

