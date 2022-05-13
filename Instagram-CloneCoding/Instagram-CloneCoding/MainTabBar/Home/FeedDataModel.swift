//
//  FeedDataModel.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/06.
//

import UIKit

struct FeedDataModel {
    let profileImageName: String
    var profileImage: UIImage? {
        return UIImage(named: profileImageName)
    }
    let profileName: String
    let contentImageName: String
    var contentImage: UIImage? {
        return UIImage(named: contentImageName)
    }
    let likeNumber: Int
    var like: String? {
        return "좋아요 \(likeNumber)개"
    }
    let content: String
    let commentNumber: Int
    var comment: String? {
        return "댓글 \(commentNumber)개 모두 보기"
    }
}

extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: "avatar1", profileName: "jeongkite", contentImageName: "postImage1", likeNumber: 189, content: "안녕하세요~~", commentNumber: 3),
        FeedDataModel(profileImageName: "avatar2", profileName: "SOPT", contentImageName: "postImage2", likeNumber: 4, content: "인생은 참 빡시다", commentNumber: 5),
        FeedDataModel(profileImageName: "avatar3", profileName: "누굴까", contentImageName: "postImage3", likeNumber: 16, content: "아 졸리다 자고싶다", commentNumber: 2),
        FeedDataModel(profileImageName: "avatar4", profileName: "누구게", contentImageName: "postImage4", likeNumber: 35, content: "허리아파 발목아파 무릎아파~~~", commentNumber: 11),
    ]
}
