//
//  BountyViewController.swift
//  BountyList
//
//  Created by 유현진 on 2021/10/01.
//
// 현상금 랭킹순
// 현상금 금액 변경
// 리스트 삽입 삭제

import UIKit

class BountyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받아야겠다.
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
       
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //UIViewController에 있는 메소드
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                let bountyInfo = viewModel.bountyInfo(index)
                vc?.viewModel.update(bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfbountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(indexPath.row)
        cell.update(info: bountyInfo)

        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}


// MARK: ViewModel
// - BountyViewModel
// > BountyViewModel 만들기, 뷰 레이어에서 필요한 메서드 만들기
// > 모델 가지고 있기, BountyInfo 등

class BountyViewModel{
    let bountyInfoList: [BountyInfo] = [
        BountyInfo("brook", 33000000),
        BountyInfo("chopper", 50),
        BountyInfo("franky", 44000000),
        BountyInfo("luffy", 300000000),
        BountyInfo("nami", 16000000),
        BountyInfo("robin", 80000000),
        BountyInfo("sanji", 77000000),
        BountyInfo("zoro", 120000000)
    ]
    var sortedList: [BountyInfo] {
        bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
    }
    
    var numOfbountyInfoList: Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(_ index: Int) -> BountyInfo{
        return sortedList[index]
    }
}
