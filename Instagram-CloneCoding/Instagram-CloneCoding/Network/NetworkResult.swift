//
//  NetworkResult.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case notFound
    case invalid
    case pathErr
    case serverErr
    case networkFail
}
