import UIKit

extension MovieDetailViewController {
    
    @IBAction
    func creditsPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ReviewsListViewController") as? ReviewsListViewController else {
            return
        }
        vc.viewModel.movie = self.viewModel.movie
        
        
        // add a new button and then move this to it:
        /*
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CreditsViewController") as? CreditsViewController else {
            return
        }

        vc.viewModel.movie = self.viewModel.movie

        vc.dataSource.delegatedViewController = vc
        */
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

