//
//  DatabaseManager.swift
//  FirebaseChatApp
//
//  Created by 권정근 on 1/14/25.
//

import Foundation
import FirebaseDatabase


final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
}


// MARK: - Account Management
extension DatabaseManager {
    
    /// 이메일 중복 검사 
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {

        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? [String: Any] != nil else {
                completion(false)
                return
            }

            completion(true)
        })

    }
    
    /// 유저 정보를 데이터베이스에 저장
    public func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}


/// firebase에 저장하기 위한 유저 정보를 담은 구조체
struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    //let profilePictureUrl: String
}
