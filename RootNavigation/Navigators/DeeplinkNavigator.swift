//
//  DeeplinkNavigator.swift
//  DeepLinks
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import UIKit



class DeeplinkNavigator {
    static let shared = DeeplinkNavigator()
    
    private init() {}
    
    func proceesToDeeplink(_ type: DeepLinkType) {
        print(#function)
        
        switch type {
        case.activity:
            displayAlert(title: Constants.DeeplinkNavigator.activity)
        case .messages(.root):
            displayAlert(title: Constants.DeeplinkNavigator.messagesRoot)
        case .messages(.details(id: let id)):
            displayAlert(title: "\(Constants.DeeplinkNavigator.messagesDetails) \(id)")
        case .newListing:
            displayAlert(title: Constants.DeeplinkNavigator.newListing)
        case .request(id: let id):
            displayAlert(title: "\(Constants.DeeplinkNavigator.requestDetails) \(id)")
        }
    }
    
    func displayAlert(title: String) {
        if let vc = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController {
            vc.show(message: title)
        }
    }
}
