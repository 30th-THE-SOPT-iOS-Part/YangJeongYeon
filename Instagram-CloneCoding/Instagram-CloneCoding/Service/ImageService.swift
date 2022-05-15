//
//  ImageService.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/15.
//

import Foundation
import Alamofire

class IamgeService {
    static let shared = IamgeService()
    private init() {}
    
    func getImages(completion: @escaping (NetworkResult<Array<ImageResponseModel>?>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(APIConstants.imageListURL,
                                     method: .get,
                                     parameters: nil,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult: NetworkResult<Array<ImageResponseModel>?> = self.judgeStatus(by: statusCode, value)
                
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
