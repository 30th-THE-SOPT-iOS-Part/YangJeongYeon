//
//  StoryDataModel.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/06.
//

import Foundation

struct StoryDataModel {
    let storyImageName: String
    let storyName: String
}

extension StoryDataModel {
    static let sampleData: [StoryDataModel] = [
        StoryDataModel(storyImageName: "avatar1", storyName: "jeongkite"),
        StoryDataModel(storyImageName: "avatar2", storyName: "SOPT"),
        StoryDataModel(storyImageName: "avatar3", storyName: "누굴까"),
        StoryDataModel(storyImageName: "avatar4", storyName: "누구게"),
        StoryDataModel(storyImageName: "avatar5", storyName: "나도"),
        StoryDataModel(storyImageName: "avatar6", storyName: "모르지롱"),
        StoryDataModel(storyImageName: "avatar7", storyName: "sssua_0928")
    ]
}
