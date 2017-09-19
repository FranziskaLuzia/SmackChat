//
//  Constants.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/16/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


// URL Constants
let BASE_URL = "https://smackchatyapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail" 

