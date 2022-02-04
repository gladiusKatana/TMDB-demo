import Foundation; import UIKit

protocol ReviewsListDataSourceDelegate: AnyObject {
    func didSelectReview(_ review: Review)
}

class ReviewsListDataSource: NSObject {
    
    var reviews: [Review] = []
    
    private weak var delegate: ReviewsListDataSourceDelegate?
    
    
    init(delegate: ReviewsListDataSourceDelegate) {
        self.delegate = delegate
    }
}

extension ReviewsListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewListCell") as? ReviewListCell else {
            return UITableViewCell()
        }
        let review = reviews[indexPath.row]
        cell.render(with: review)
        return cell
    }
}

extension ReviewsListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let review = reviews[indexPath.row]
        delegate?.didSelectReview(review)
    }
}

