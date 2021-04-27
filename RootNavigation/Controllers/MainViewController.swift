//
//  MainViewController.swift
//  RootNavigation
//
//  Created by Dmitrii Voronin on 25.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MainViewController {
    func configure() {
        view.backgroundColor = .lightGray
        title = "Main Screen"
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
    }
    
    @objc
    func logout() {
        UserDefaults.standard.set(false, forKey: Constants.UserDefaultsKey.loggedIn)
        SceneDelegate.shared.rootViewController.switchToLogout()
    }
}
