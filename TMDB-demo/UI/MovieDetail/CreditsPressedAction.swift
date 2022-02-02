import UIKit

extension MovieDetailViewController {
    
    @IBAction
    func creditsPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CreditsViewController") as? CreditsViewController else {
            return
        }
        
        vc.viewModel.movie = self.viewModel.movie
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

