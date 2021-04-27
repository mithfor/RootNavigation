//
//  RootViewController.swift
//  RootNavigation
//
//  Created by Dmitrii Voronin on 25.04.2021.
//

import UIKit

class RootViewController: UIViewController {

    private var currentVC: UIViewController
    var deepLink: DeepLinkType? {
        didSet {
            handleDeeplink()
        }
    }
        
    init() {
        self.currentVC = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(currentVC)
        currentVC.view.frame = view.bounds
        view.addSubview(currentVC.view)
        currentVC.didMove(toParent: self)
    }
    
    private func handleDeeplink() {
        print(#function)
    }
}

extension RootViewController {
    func switchToLoginScreen() {
        let loginViewController = UINavigationController(rootViewController: LoginViewController())
        addChild(loginViewController)
        loginViewController.view.frame = self.view.bounds
        self.view.addSubview(loginViewController.view)
        loginViewController.didMove(toParent: self)
        currentVC.willMove(toParent: nil)
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParent()
        currentVC = loginViewController
    }
    
    func switchToMainScreen() {
        animateFadeTransition(to: screen(from: MainViewController()))
    }
    
    func switchToLogout() {
        animateDismissTransition(to: screen(from: LoginViewController()))
    }
}

private extension RootViewController {
    
    func screen(from vc: UIViewController) -> UIViewController {
        return UINavigationController(rootViewController: vc)
    }
    
    func animateFadeTransition(to new: UIViewController, completion: (() -> ())? = nil) {
        currentVC.willMove(toParent: nil)
        addChild(new)
        
        transition(from: currentVC, to: new, duration: 0.5, options: [.transitionCrossDissolve, .curveEaseOut]) {} completion: { [weak self] (completed) in
            self?.currentVC.removeFromParent()
            new.didMove(toParent: self)
            self?.currentVC = new
            completion?()
        }
    }
    
    func animateDismissTransition(to newVC: UIViewController, completion: (() -> Void)? = nil) {
        let initialFrame = CGRect(x: -view.bounds.width,
                                  y: 0,
                                  width: view.bounds.width,
                                  height: view.bounds.height)
        
        currentVC.willMove(toParent: nil)
        addChild(newVC)
        
        transition(from: currentVC, to: newVC, duration: 0.5, options: []) {
            newVC.view.frame = self.view.bounds
        } completion: { [weak self] (comleted) in
            self?.currentVC.removeFromParent()
            newVC.didMove(toParent: self)
            self?.currentVC = newVC
            completion?()
        }
    }
}

