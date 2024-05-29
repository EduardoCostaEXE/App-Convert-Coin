//
//  UIView.swift
//  Convert Coin
//
//  Created by Cabral Costa, Eduardo on 28/05/24.
//

import UIKit

extension UIView {
    public func showMessageView(view:UIViewController, message:String, title:String? = "Atenção", btnTile:String? = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTile, style: .default, handler: nil))
        view.present(alert, animated: true)
    }
}
