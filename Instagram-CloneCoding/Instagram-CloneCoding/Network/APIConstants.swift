//
//  APIConstants.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/14.
//

import Foundation

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: Auth URL
    static let signupURL = baseURL + "/auth/signup"
    static let loginURL = baseURL + "/auth/signin"
    
    // MARK: Image URL
    static let imageListURL = "https://picsum.photos/v2/list"
}
