//
//  SplashViewController.swift
//  RootNavigation
//
//  Created by Dmitrii Voronin on 25.04.2021.
//

import UIKit

class SplashViewController: UIViewController {

    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        makeServiceCall()
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

private extension SplashViewController {
    func configure() {
        configureView()
        configureActivityIndicator()
    }
    
    func configureView() {
        view.backgroundColor = .systemGray
        view.addSubview(activityIndicator)
    }
    
    func configureActivityIndicator() {
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
    }
    
    func makeServiceCall() {
        print(#function)
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: Constants.UserDefaultsKey.loggedIn) {
                SceneDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                SceneDelegate.shared.rootViewController.switchToLogout()
            }
        }
    }
    
}
