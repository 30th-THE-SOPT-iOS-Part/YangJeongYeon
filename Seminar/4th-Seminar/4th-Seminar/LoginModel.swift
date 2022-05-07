//
//  LoginModel.swift
//  4th-Seminar
//
//  Created by 정연 on 2022/05/07.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
    let email: String
}
