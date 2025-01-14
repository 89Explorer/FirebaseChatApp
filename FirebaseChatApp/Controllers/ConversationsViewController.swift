//
//  ConversationsViewController.swift
//  FirebaseChatApp
//
//  Created by 권정근 on 1/14/25.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }

    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            let loginNav = UINavigationController(rootViewController: loginVC)
            loginNav.modalPresentationStyle = .fullScreen
            present(loginNav, animated: true)
        }
    }

}

