import Foundation; import UIKit

extension CreditsViewController {
    
    func setupCreditsUI() {
        creditsTableView.rowHeight = 200
        creditsTableView.register(UINib(nibName: "CastAndCrewCell", bundle: nil), forCellReuseIdentifier: "CastAndCrewCell")
        creditsTableView.dataSource = dataSource
        creditsTableView.delegate = dataSource
    }
    
}

