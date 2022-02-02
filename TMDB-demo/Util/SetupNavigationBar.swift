import UIKit

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

