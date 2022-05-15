//
//  DataModel.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/14.
//

import Foundation

// TODO: 제너릭 써서 머시기.. 깔끔하게.. 재활용...🗑♻️
// MARK: Login Data
struct LoginResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginData?
}
struct LoginData: Codable {
    let name: String
    let email: String
}

// MARK: SignUp Data
struct SignupResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignupData?
}
struct SignupData: Codable {
    let id: Int
}
