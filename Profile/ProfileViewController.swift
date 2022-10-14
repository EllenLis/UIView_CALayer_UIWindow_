//
//  ProfileViewController.swift
//  UIView_CALayer_UIWindow_Lysenskaia
//
//  Created by ElenaL on 05.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray
            view.addSubview(profileHeaderView)
            self.title = "Profile"
        }

        override func viewWillLayoutSubviews() {
            profileHeaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            profileHeaderView.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
        }

}
