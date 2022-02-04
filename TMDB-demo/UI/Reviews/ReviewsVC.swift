import Foundation; import UIKit; import SideMenu

class ReviewsListViewController: UIViewController/*, ActivityIndicatorContainer*/ {
    
    //@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ReviewsListViewModel()
    lazy var dataSource = ReviewsListDataSource(delegate: self)
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    
    // may use this later:
    /*
    convenience init?(coder: NSCoder) {
        self.init(coder: coder)
    }
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReviewsUI()
        
        viewModel.bind(to: self)
        updateReviewsListUIAndFetch()
    }
    
    
    func updateReviewsListUIAndFetch() {
        //activityIndicator.startAnimating()
        tableView.isHidden = true
        viewModel.serviceFetchReviews(usingMockData: false)
    }

    
    func setupReviewsUI() {
        
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: "ReviewListCell", bundle: nil), forCellReuseIdentifier: "ReviewListCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
}

extension ReviewsListViewController: ReviewsListDataSourceDelegate {
    
    func didSelectReview(_ review: Review) {
        
        print("\n\n\nSelected review by \(review.id)\n\n\n")
    }
}

