//
//  Constants.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/28/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: URL Constants
let BASE_URL = "https://yallachatting.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

// MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//MARK: Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]


