import UIKit; import Kingfisher

class CastAndCrewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    var stickFigureUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "stickFigure", ofType:"png")!)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subviewSetup()
    }
    
    func render(castMember: Cast?, crewMember: Crew?) {
        var imageURL = stickFigureUrl
        
        if castMember != nil {
            imageURL = assignSafeProfilePath(testPath: castMember?.profilePath)
        } else {
            if crewMember != nil {
                imageURL = assignSafeProfilePath(testPath: crewMember?.profilePath)
            }
        }
        photoImageView.kf.setImage(with: imageURL)
        titleLabel.text = castMember != nil ? castMember?.name : crewMember?.name
        roleLabel.text = castMember != nil ? castMember?.character : "(\(crewMember?.job ?? "no job data"))"
    }
    
    func assignSafeProfilePath(testPath: String?) -> URL {
        var returnUrl = stickFigureUrl
        if testPath != nil {
            returnUrl = URL(string: Constants.imageBaseURL + testPath!)!
        }
        return returnUrl
    }
    
    func subviewSetup() {
        photoImageView.layer.cornerRadius = 10
        photoImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowRadius = 6
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        mainView.layer.borderWidth = 0.5
        let shadowRect = CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height - 20)
        mainView.layer.shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: 10).cgPath
    }
}

