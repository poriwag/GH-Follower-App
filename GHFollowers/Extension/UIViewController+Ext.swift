//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Billy Pak on 9/30/20.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen        //Covers the screen(doesnt show card view)
            alertVC.modalTransitionStyle = .crossDissolve           //fades in (NO flash in screen)
            self.present(alertVC, animated: true)
        }
    }
}
