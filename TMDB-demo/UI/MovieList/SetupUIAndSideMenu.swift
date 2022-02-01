import Foundation; import UIKit; import SideMenu

extension MovieListViewController {
    
    /*private*/ func setupMovieListUI() {
        
        switch globalMovieTypeString {
        case "top_rated" : title = "Top Rated Movies"
        default: title = "Now Playing Movies"
        }
        
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    /*private*/ func setupSideMenu() {
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {
            return
        }
        vc.delegate = self
        let leftMenu = UISideMenuNavigationController(rootViewController: vc)
        leftMenu.navigationBar.isHidden = true
        SideMenuManager.default.menuLeftNavigationController = leftMenu
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuAnimationFadeStrength = 0.3
        
        if let navigationController = navigationController {
            SideMenuManager.default.menuAddPanGestureToPresent(toView: navigationController.navigationBar)
            SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: navigationController.view)
        }
    }
}

