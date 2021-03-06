import Foundation; import UIKit

class CreditsViewController: UIViewController, CreditsDataSourceDelegate {
    
    @IBOutlet weak var creditsTableView: UITableView!

    lazy var dataSource = CreditsDataSource(delegate: self, delegatedViewController: CreditsViewController())
    
    let viewModel = CreditsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCreditsUI()
        
        viewModel.bind(to: self)
        
        updateCreditsUIAndFetch()
    }
    
    private func updateCreditsUIAndFetch() {
        //activityIndicator.startAnimating()    //** for nicer UX if delays
        creditsTableView.isHidden = true
        viewModel.serviceFetchCredits()
    }
    
    private func setupCreditsUI() {
        creditsTableView.rowHeight = 200
        creditsTableView.register(UINib(nibName: "CastAndCrewCell", bundle: nil), forCellReuseIdentifier: "CastAndCrewCell")
        creditsTableView.dataSource = dataSource
        creditsTableView.delegate = dataSource
    }
    
}

