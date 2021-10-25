//
//  TrackCollectionViewCell.swift
//  AppleMusicStApp
//
//  Created by 유현진 on 2021/10/15.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    func awakeFormNib(){
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    func updateUI(item: Track?){
        // TODO: 곡정보 표시하기
    }
}
