import UIKit

var credsVC = CreditsViewController() /// storyboard-instantiated credits-view controller instance, for calling setupNavigationBar(:), ie updating it

extension UIViewController {
    
    func setupNavigationBar(withTitle title: String) {
        self.title = title
        
        if self is MovieListViewController {
            navigationItem.largeTitleDisplayMode = .always
        }
        else {
            navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    
}

