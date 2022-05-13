//
//  StoryCollectionViewCell.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/06.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(storyData: StoryDataModel) {
        storyImageView.image = UIImage(named: storyData.storyImageName)
        storyNameLabel.text = storyData.storyName
    }

}
