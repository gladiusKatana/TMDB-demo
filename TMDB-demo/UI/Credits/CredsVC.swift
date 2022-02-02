import Foundation; import UIKit

class CreditsViewController: UIViewController, CreditsDataSourceDelegate {
    
    @IBOutlet weak var creditsTableView: UITableView!
    
    lazy var dataSource = CreditsDataSource(delegate: self)
    let viewModel = CreditsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCreditsUI()
        setupNavigationBar(withTitle: "Cast")
        
        viewModel.bind(to: self)
        updateCreditsUIAndFetch()
    }
    
    private func updateCreditsUIAndFetch() {
        //activityIndicator.startAnimating()    //** for nicer UX if delays
        creditsTableView.isHidden = true
        viewModel.serviceFetchCredits()
    }
    
}

