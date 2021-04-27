//
//  DeeplinkParser.swift
//  DeepLinks
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import Foundation



class DeeplinkParser {
    static let shared = DeeplinkParser()
    
    private init() {}
}

extension DeeplinkParser {
    func parseDeeplink(_ url: URL) -> DeepLinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host
        else { return nil }
        
        var pathComponents = components.path.components(separatedBy: Constants.DeeplinkURLComponents.separator)
        pathComponents.removeFirst()
        
        switch host {
        case Constants.DeeplinkURLComponents.messages:
            if let messageId = pathComponents.first {
                return DeepLinkType.messages(.details(id: messageId))
            }
        case Constants.DeeplinkURLComponents.request:
            if let requestId = pathComponents.first {
                return DeepLinkType.request(id: requestId)
            }
        default:
            break
        }
        return nil
    }
}
