//
//  FeedTableViewCell.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/06.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let identifier = "FeedTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var contentNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ feedData: FeedDataModel) {
        profileImageView.image = feedData.profileImage
        profileNameLabel.text = feedData.profileName
        contentImageView.image = feedData.contentImage
        likesLabel.text = feedData.like
        contentNameLabel.text = feedData.profileName
        contentLabel.text = feedData.content
        commentsLabel.text = feedData.comment
    }
}
