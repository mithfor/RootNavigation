//
//  DeepLinkType.swift
//  BookingLink
//
//  Created by Dmitrii Voronin on 24.04.2021.
//

import Foundation

enum DeepLinkType {
    enum Messages {
        case root
        case details(id: String)
    }
    
    case messages(Messages)
    case activity
    case newListing
    case request(id: String)
}
