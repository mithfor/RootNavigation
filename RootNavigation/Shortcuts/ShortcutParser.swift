//
//  ShortcutParser.swift
//  DeepLinks
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import UIKit

enum ShortcutKey: String {
    case newListing = "com.myApp.newListing"
    case activity = "com.myApp.activity"
    case messages = "com.myApp.messages"
}

class ShortcutParser {
    static let shared = ShortcutParser()
    private init() {}
}

// TODO: - remove copypaste
extension ShortcutParser {
    func registerShortcuts(for profileType: ProfileType) {
        print(#function)
        
        let activityIcon = UIApplicationShortcutIcon(templateImageName: "Alert Icon")
        let activityShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.activity.rawValue,
                                                             localizedTitle: "Recent Activity",
                                                             localizedSubtitle: nil,
                                                             icon: activityIcon,
                                                             userInfo: nil)
        let messageIcon = UIApplicationShortcutIcon(templateImageName: "Messenger Icon")
        let messageShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.messages.rawValue,
                                                             localizedTitle: "Messages",
                                                             localizedSubtitle: nil,
                                                             icon: messageIcon,
                                                             userInfo: nil)
        
        UIApplication.shared.shortcutItems = [activityShortcutItem, messageShortcutItem]
        
        switch profileType {
        case .host:
            let newListingIcon = UIApplicationShortcutIcon(templateImageName: "New Listing Icon")
            let newListingShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.newListing.rawValue,
                                                                 localizedTitle: "New Listing",
                                                                 localizedSubtitle: nil,
                                                                 icon: newListingIcon,
                                                                 userInfo: nil)
            
            UIApplication.shared.shortcutItems?.append(newListingShortcutItem)
        case .guest:
             break
        }
    }
    
    func parseShortcut(_ shortcut: UIApplicationShortcutItem) -> DeepLinkType? {
        switch shortcut.type {
        case ShortcutKey.activity.rawValue:
            return .activity
        case ShortcutKey.messages.rawValue:
            return .messages(.root)
        case ShortcutKey.newListing.rawValue:
            return .newListing
        default:
            return nil
        }
    }
}
