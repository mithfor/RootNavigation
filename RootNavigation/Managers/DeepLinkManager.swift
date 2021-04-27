//
//  DeepLinkManager.swift
//  BookingLink
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import UIKit

let DeepLinker = DeepLinkManager()

class DeepLinkManager {
//    static let shared = DeepLinkManager()
    
    fileprivate init() {}
    
    private var deeplinkType: DeepLinkType?

    private func resetDeeplinkType( ) {
        print(#function)
        self.deeplinkType = nil
    }
}

extension DeepLinkManager {
    
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else { return }
        
        DeeplinkNavigator.shared.proceesToDeeplink(deeplinkType)
        resetDeeplinkType()
    }
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.parseShortcut(item)
        return deeplinkType != nil
    }
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeeplink(url)
        return deeplinkType != nil
    }
    
    func handleNotificcation(_ notification: [AnyHashable : Any]) {
        deeplinkType = NotificationPaser.shared.parseNotification(notification)
    }
}
