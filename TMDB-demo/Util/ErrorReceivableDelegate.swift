import Foundation; import UIKit

protocol ErrorReceivableDelegate: AnyObject {
    func didReceiveError(_ errorMessage: String)
}

extension ErrorReceivableDelegate where Self: UIViewController & ActivityIndicatorContainer {
    func didReceiveError(_ errorMessage: String) {
        activityIndicator.stopAnimating()
        handleError(errorMessage)
    }
}

extension ErrorReceivableDelegate where Self: UIViewController {
    func didReceiveError(_ errorMessage: String) {
        handleError(errorMessage)
    }
}

