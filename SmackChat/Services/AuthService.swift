//
//  AuthService.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/19/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import Foundation
import Alamofire

// logins, create user, register user

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var usLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        } set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToke: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        } set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        } set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    //Alamofire.request("mongodb://<dbuser>:<dbpassword>@ds141474.mlab.com:41474/smackchatty")
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
