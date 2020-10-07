//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Billy Pak on 9/29/20.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false         //this is to show the search because on search VC
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetWorkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }
    
    func viewWillApear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }



}
