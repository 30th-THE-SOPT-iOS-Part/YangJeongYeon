//
//  DataModel.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/14.
//

import Foundation

struct LoginData: Codable {
    let name: String
    let email: String
}

struct SignupData: Codable {
    let id: Int
}

struct ResponseData<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
