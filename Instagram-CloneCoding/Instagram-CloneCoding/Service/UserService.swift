//
//  UserService.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/14.
//

// TODO: 이거 너무너무너무 중복되는데.. 함수로 빼서 재활용해서 쓰고싶다....
import Foundation
import Alamofire

class UserService {
    static let shared = UserService()
    private init() {}
    
    func signup(name: String, email: String, password: String, completion: @escaping (NetworkResult<SignupData?>) -> Void) {
        let url = APIConstants.signupURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult:NetworkResult<SignupData?> = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    func login(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<LoginData?>) -> Void)
    {
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult: NetworkResult<LoginData?> = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data) -> NetworkResult<T?> {
        switch statusCode {
        case 200, 201: return isValidData(data: data)
        case 404: return .notFound
        case 409: return .invalid
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData<T: Codable>(data: Data) -> NetworkResult<T?> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ResponseData<T>.self, from: data)
        else { return .pathErr }
        return .success(decodedData.data)
    }
}
