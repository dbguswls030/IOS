//
//  UserInformation.swift
//  signUpPage
//
//  Created by 유현진 on 2021/04/19.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var phoneNumber: String?
    var date: Date?
}
