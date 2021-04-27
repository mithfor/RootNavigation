//
//  NotificationParser.swift
//  DeepLinks
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import Foundation

class NotificationPaser {
    static let shared = NotificationPaser()
    
    private init() {}
    
}

extension NotificationPaser {
    func parseNotification(_ userInfo: [AnyHashable : Any]) -> DeepLinkType? {
        print(#function)
        if let data = userInfo[Constants.NotificationParser.data] as? [String : Any] {
            if let messageId = data[Constants.NotificationParser.messageId] as? String {
                return DeepLinkType.messages(.details(id: messageId))
            }
        }
        
        return nil
    }
}
