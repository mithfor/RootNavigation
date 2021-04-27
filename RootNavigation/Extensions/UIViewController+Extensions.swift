//
//  UIViewController+Extension.swift
//  MithforCodeBase
//
//  Created by Dmitrii Voronin on 01.04.2021.
//

import UIKit

extension UIViewController {

    func show(message: String, title: String? = nil, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for a in actions {
            alert.addAction(a)
            }
        present(alert, animated: true, completion: nil)
    }

    func show(actionTitle title: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        for a in actions {
            alert.addAction(a)
        }
        present(alert, animated: true, completion: nil)
    }

    func show(message: String, title: String? = nil, handler: (()->Void)? = nil) {
        show(message: message, title: title, actions: [UIAlertAction(title: "OK", style: .default, handler: { _ in handler?() })])
    }
}
