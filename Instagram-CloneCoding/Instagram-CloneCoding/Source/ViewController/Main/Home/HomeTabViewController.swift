//
//  HomeTabViewController.swift
//  Instagram-CloneCoding
//
//  Created by 정연 on 2022/05/06.
//

import UIKit

class HomeTabViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: UI
    private func configureUI(){
        let storyNib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        let feedNib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        feedTableView.register(feedNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
}

extension HomeTabViewController: UICollectionViewDelegate {
    
}

// MARK: - UI
extension HomeTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setData(storyData: StoryDataModel.sampleData[indexPath.row])
        return cell
    }
}

extension HomeTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 0, bottom: 8, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

extension HomeTabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 488
    }
}

extension HomeTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        
        cell.setData(FeedDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
}
