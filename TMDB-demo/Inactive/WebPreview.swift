//import UIKit; import WebKit
//
//extension MovieDetailViewController {
//    
//    func setupWebBasedPreviewPlayer() {
//        
//        let configuration = WKWebViewConfiguration()
//        configuration.allowsInlineMediaPlayback = true
//        configuration.mediaTypesRequiringUserActionForPlayback = []
//        
//        let genresLabelBottomPlusGap = genresLabel.frame.minY + genresLabel.frame.height + CGFloat(10)
//        
//        let height = (UIApplication.shared.keyWindow?.frame.height)! - genresLabelBottomPlusGap
//        
//        let wkViewFrame = CGRect(x: 0,
//                                 y: genresLabelBottomPlusGap,
//                                 width: view.frame.width,
//                                 height: height)
//        
//        let wkwebview = WKWebView(frame: wkViewFrame, configuration: configuration)
//        
//        view.addSubview(wkwebview)
//        
//        if let url = URL(string: "https://www.youtube.com/watch?v=6hB3S9bIaco") {
//            let request = URLRequest(url: url)
//            wkwebview.load(request)
//        }
//    }
//}
//
