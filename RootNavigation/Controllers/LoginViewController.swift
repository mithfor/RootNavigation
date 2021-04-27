//
//  LoginViewController.swift
//  RootNavigation
//
//  Created by Dmitrii Voronin on 25.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

private extension LoginViewController {
    func configure() {
        view.backgroundColor = .white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In",
                                          style: .plain,
                                          target: self,
                                          action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
    }
    
    @objc
    func login() {
        UserDefaults.standard.set(true, forKey: Constants.UserDefaultsKey.loggedIn)
        
//         TODO: - navigate to Main Screen
        SceneDelegate.shared.rootViewController.switchToMainScreen()
    }
}
