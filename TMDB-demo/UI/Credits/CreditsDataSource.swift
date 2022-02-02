import Foundation; import UIKit

protocol CreditsDataSourceDelegate: AnyObject { }

class CreditsDataSource: NSObject {
    
    var cast: [Cast] = []
    var crew: [Crew] = []
    
    private weak var delegate: CreditsDataSourceDelegate?
    
    init(delegate: CreditsDataSourceDelegate) {
        self.delegate = delegate
    }
}

extension CreditsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count + crew.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CastAndCrewCell") as? CastAndCrewCell else {
            return UITableViewCell()
        }
        
        updateNavigationBarTitle(indexPath)
        
        if indexPath.row < cast.count {
            let castMember = cast[indexPath.row]
            cell.render(castMember: castMember, crewMember: nil)
        } else {
            let crewMember = crew[indexPath.row - cast.count]
            cell.render(castMember: nil, crewMember: crewMember)
        }
        return cell
    }
}

extension CreditsDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {   print("selected credits row \(indexPath.row)")
    }
}

