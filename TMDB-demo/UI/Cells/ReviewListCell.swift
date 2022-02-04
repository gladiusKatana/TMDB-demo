import UIKit; import Kingfisher; import Cosmos

class ReviewListCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowRadius = 6
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        mainView.layer.borderWidth = 0.5
        let shadowRect = CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height - 20)
        mainView.layer.shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: 10).cgPath
    }
    
    func render(with review: Review) {
        
        ratingView.rating = 5 //review.rating / 2   // this would be great but ... Review.rating is not implemented AT LEAST W/ CURRENT URL CONSTRUCTION
        authorLabel.text = review.author
        bodyLabel.text = review.content
        dateLabel.text = String(review.updatedAt.prefix(10)) //YYYY-MM-DD
    }
}

