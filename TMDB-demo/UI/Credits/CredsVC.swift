import Foundation; import UIKit

class CreditsViewController: UIViewController, CreditsDataSourceDelegate {
    
    @IBOutlet weak var creditsTableView: UITableView!
    
    lazy var dataSource = CreditsDataSource(delegate: self)
    let viewModel = CreditsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCreditsUI()
        //setupNavigationBar(withTitle: "Credits")
        
        viewModel.bind(to: self)
        updateCreditsUIAndFetch()
    }
    
    private func updateCreditsUIAndFetch() {
        //activityIndicator.startAnimating()    // if have time, add an activity indicator for nicer UX if delays
        creditsTableView.isHidden = true
        viewModel.serviceFetchCredits()
    }
    
}

