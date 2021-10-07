//
//  DetailViewController.swift
//  BountyList
//
//  Created by 유현진 on 2021/10/04.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // MARK: Model
    // - bountyInfo
    // > bountyInfo 만들기

    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    // MARK: View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel를 통해서 구성되기
    func updateUI(){
        if let bountyInfo = self.viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: ViewModel
// - DetailViewModel
// > 뷰 레이어에서 필요한 메서드 만들기
// > 모델 가지고 있기, BountyInfo 등
class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(_ model: BountyInfo?){
        bountyInfo = model
    }
}
