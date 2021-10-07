//
//  BountyInfo.swift
//  BountyList
//
//  Created by 유현진 on 2021/10/05.
//

import UIKit

// MARK: Model
// - bountyInfo
// > bountyInfo 만들기
struct BountyInfo{
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(_ name: String, _ bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
