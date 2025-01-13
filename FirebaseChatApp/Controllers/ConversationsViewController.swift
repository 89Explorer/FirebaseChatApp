//
//  ConversationsViewController.swift
//  FirebaseChatApp
//
//  Created by 권정근 on 1/14/25.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        if !isLoggedIn {
            let loginVC = LoginViewController()
            let loginNav = UINavigationController(rootViewController: loginVC)
            loginNav.modalPresentationStyle = .fullScreen
            present(loginNav, animated: true)
        }
    }


}

